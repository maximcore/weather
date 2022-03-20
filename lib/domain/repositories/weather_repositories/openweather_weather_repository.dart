import 'package:dio/dio.dart';
import 'package:location/location.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:weather/config/update_time.dart';
import 'package:weather/domain/entities/weather/day_weather_entity.dart';
import 'package:weather/domain/entities/weather/todays_weather_entity.dart';
import 'package:weather/domain/entities/weather/weather_entity.dart';
import 'package:weather/domain/repositories/weather_repositories/weather_repository.dart';
import 'package:weather/presentation/blocs/connectivity_bloc/connectivity_state.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class OpenweatherWeatherRepository implements WeatherRepository {
  static const String apiKey = '53840e52a417541aa6608e2a006d1094';
  String dbPath = 'weather.db';

  OpenweatherWeatherRepository._();

  static final OpenweatherWeatherRepository _instance = OpenweatherWeatherRepository._();

  static OpenweatherWeatherRepository get instance => _instance;

  @override
  Future<WeatherEntity> fetchWeather({
    required Location location,
    required ConnectivityStatus status,
  }) async {
    var dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    var dbPath = join(dir.path, 'my_database.db');
    var db = await databaseFactoryIo.openDatabase(dbPath);
    var store = StoreRef.main();

    late final WeatherEntity weather;
    if (status == ConnectivityStatus.connected) {
      final location = Location();
      final coordinates = await location.getLocation();
      final lat = coordinates.latitude;
      final lon = coordinates.longitude;

      final dio = Dio();

      final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey',
      );
      final weatherJson = response.data as Map<String, dynamic>;
      weather = WeatherEntity.fromJson(weatherJson);

      await store.record('weather').put(db, weatherJson);
      final time = DateTime.now().millisecondsSinceEpoch;
      await store.record('time').put(db, time);

    } else {
      final weatherJson = await store.record('weather').get(db) as Map<String, dynamic>;
      weather = WeatherEntity.fromJson(weatherJson);
      final time = await store.record('time').get(db) as int;
      updateTime = UpdateTime.whenUpdated(time);
    }
    return weather;
  }

  @override
  Future<WeatherEntity> fetchWeatherByCoordinates({
    required num lat,
    required num lon,
    required ConnectivityStatus status,
  }) async {
    final response = await Dio().get(
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey',
    );
    final weatherJson = response.data as Map<String, dynamic>;
    final weather = WeatherEntity.fromJson(weatherJson);

    return weather;
  }

  @override
  Future<List<DayWeatherEntity>> fetchWeatherForWeek({
    required Location location,
    required ConnectivityStatus status,
  }) async {
    var dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    var dbPath = join(dir.path, 'my_database.db');
    var db = await databaseFactoryIo.openDatabase(dbPath);
    var store = StoreRef.main();

    final result = <DayWeatherEntity>[];

    if (status == ConnectivityStatus.connected) {
      final location = Location();
      final coordinates = await location.getLocation();
      final lat = coordinates.latitude;
      final lon = coordinates.longitude;
      final response = await Dio().get(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=current,historical,national,minutely,hourly&appid=$apiKey',
      );
      final weatherJson = response.data as Map<String, dynamic>;
      final weakWeatherList = (weatherJson['daily'] as List<dynamic>);
      for (int i = 1; i < 8; i++) {
        result.add(
          DayWeatherEntity(
            msecSinceEpoch: (weakWeatherList[i]['dt']) * 1000,
            feelsLikeDegrees: (weakWeatherList[i]['feels_like']['day'] as num).ceil(),
            dayDegrees: (weakWeatherList[i]['temp']['day'] as num).ceil(),
            nightDegrees: (weakWeatherList[i]['temp']['night'] as num).ceil(),
            main: (weakWeatherList[i]['weather'] as List)[0]['main'] as String,
          ),
        );
      }

      await store.record('dayWeather').put(db, weatherJson);
    } else {
      var weatherJson = await store.record('dayWeather').get(db) as Map<String, dynamic>;
      final weakWeatherList = (weatherJson['daily'] as List<dynamic>);
      for (int i = 1; i < 8; i++) {
        result.add(
          DayWeatherEntity(
            msecSinceEpoch: (weakWeatherList[i]['dt']) * 1000,
            feelsLikeDegrees: (weakWeatherList[i]['feels_like']['day'] as num).ceil(),
            dayDegrees: (weakWeatherList[i]['temp']['day'] as num).ceil(),
            nightDegrees: (weakWeatherList[i]['temp']['night'] as num).ceil(),
            main: (weakWeatherList[i]['weather'] as List)[0]['main'] as String,
          ),
        );
      }
    }
    return result;
  }

  @override
  Future<List<DayWeatherEntity>> fetchWeatherForWeekByCoordinates({
    required num lat,
    required num lon,
    required ConnectivityStatus status,
  }) async {
    final response = await Dio().get(
      'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=current,historical,national,minutely,hourly&appid=$apiKey',
    );
    final result = <DayWeatherEntity>[];
    final weatherJson = response.data as Map<String, dynamic>;
    final weakWeatherList = (weatherJson['daily'] as List<dynamic>);
    for (int i = 1; i < 8; i++) {
      result.add(
        DayWeatherEntity(
          msecSinceEpoch: weakWeatherList[i]['dt'] * 1000,
          feelsLikeDegrees: (weakWeatherList[i]['feels_like']['day'] as num).ceil(),
          dayDegrees: (weakWeatherList[i]['temp']['day'] as num).ceil(),
          nightDegrees: (weakWeatherList[i]['temp']['night'] as num).ceil(),
          main: (weakWeatherList[i]['weather'] as List)[0]['main'] as String,
        ),
      );
    }
    return result;
  }

  @override
  Future<List<TodaysWeatherEntity>> fetchHourlyTodaysWeather({
    required Location location,
    required ConnectivityStatus status,
  }) async {
    final result = <TodaysWeatherEntity>[];

    var dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    var dbPath = join(dir.path, 'my_database.db');
    var db = await databaseFactoryIo.openDatabase(dbPath);
    var store = StoreRef.main();

    if (status == ConnectivityStatus.connected) {
      final location = Location();
      //final _serviceEnabled = await location.requestService();
      final coordinates = await location.getLocation();
      final lat = coordinates.latitude;
      final lon = coordinates.longitude;

      final response = await Dio().get(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=current,historical,daily,national,minutely&appid=$apiKey',
      );

      final weatherJson = response.data as Map<String, dynamic>;
      final responseWeatherList = (weatherJson['hourly'] as List<dynamic>);
      final dayWeatherList = responseWeatherList.sublist(0, 23);
      for (var item in dayWeatherList) {
        result.add(TodaysWeatherEntity(
          main: item['weather'][0]['main'],
          degrees: item['temp'],
          time: item['dt'] * 1000,
        ));
      }

      await store.record('todaysWeather').put(db, weatherJson);
    } else {
      var weatherJson = await store.record('todaysWeather').get(db) as Map<String, dynamic>;
      final responseWeatherList = (weatherJson['hourly'] as List<dynamic>);
      final dayWeatherList = responseWeatherList.sublist(0, 23);
      for (var item in dayWeatherList) {
        result.add(TodaysWeatherEntity(
          main: item['weather'][0]['main'],
          degrees: item['temp'],
          time: item['dt'] * 1000,
        ));
      }
    }
    return result;
  }

  @override
  Future<List<TodaysWeatherEntity>> fetchHourlyTodaysWeatherByCoordinates({
    required num lat,
    required num lon,
    required ConnectivityStatus status,
  }) async {
    final response = await Dio().get(
      'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=current,historical,daily,national,minutely&appid=$apiKey',
    );

    final weatherJson = response.data as Map<String, dynamic>;
    final responseWeatherList = (weatherJson['hourly'] as List<dynamic>);
    final dayWeatherList = responseWeatherList.sublist(0, 23);
    final result = <TodaysWeatherEntity>[];
    for (var item in dayWeatherList) {
      result.add(TodaysWeatherEntity(
        main: item['weather'][0]['main'],
        degrees: item['temp'],
        time: item['dt'] * 1000,
      ));
    }
    return result;
  }
}
