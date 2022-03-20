import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/domain/entities/weather/day_weather_entity.dart';
import 'package:weather/domain/entities/weather/todays_weather_entity.dart';
import 'package:weather/domain/entities/weather/weather_entity.dart';

part 'current_city_state.freezed.dart';

enum CurrentCityStatus {
  initial,
  loading,
  ready,
  error,
}

@freezed
class CurrentCityState with _$CurrentCityState {
  factory CurrentCityState({
    // add list of the weather for next 7 days
    WeatherEntity? weather,
    List<DayWeatherEntity>? weekWeather,
    List<TodaysWeatherEntity>? todaysWeather,
    required CurrentCityStatus status,
  }) = _CurrentCityState;
}
