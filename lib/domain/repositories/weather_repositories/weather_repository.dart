import 'package:location/location.dart';
import 'package:weather/domain/entities/weather/day_weather_entity.dart';
import 'package:weather/domain/entities/weather/todays_weather_entity.dart';
import 'package:weather/domain/entities/weather/weather_entity.dart';
import 'package:weather/presentation/blocs/connectivity_bloc/connectivity_state.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> fetchWeather({
    required Location location,
    required ConnectivityStatus status,
  });

  Future<WeatherEntity> fetchWeatherByCoordinates({
    required num lat,
    required num lon,
    required ConnectivityStatus status,
  });

  Future<List<DayWeatherEntity>> fetchWeatherForWeek({
    required Location location,
    required ConnectivityStatus status,
  });

  Future<List<DayWeatherEntity>> fetchWeatherForWeekByCoordinates({
    required num lat,
    required num lon,
    required ConnectivityStatus status,
  });

  Future<List<TodaysWeatherEntity>> fetchHourlyTodaysWeather({
    required Location location,
    required ConnectivityStatus status,
  });

  Future<List<TodaysWeatherEntity>> fetchHourlyTodaysWeatherByCoordinates({
    required num lat,
    required num lon,
    required ConnectivityStatus status,
  });
}
