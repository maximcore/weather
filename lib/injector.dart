import 'package:get_it/get_it.dart';
import 'package:weather/domain/repositories/connectivity_repositories/connectivity_plus_repository.dart';
import 'package:weather/domain/repositories/connectivity_repositories/connectivity_repository.dart';
import 'package:weather/domain/repositories/weather_repositories/openweather_weather_repository.dart';
import 'package:weather/domain/repositories/weather_repositories/weather_repository.dart';

void setup()  {
  GetIt.instance.registerSingleton<WeatherRepository>(
    OpenweatherWeatherRepository.instance,
  );
  GetIt.instance.registerSingleton<ConnectivityRepository>(
    ConnectivityPlusRepository.instance,
  );
}
