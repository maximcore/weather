import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:weather/domain/repositories/weather_repositories/weather_repository.dart';
import 'package:weather/presentation/blocs/connectivity_bloc/connectivity_state.dart';
import 'package:weather/presentation/blocs/current_city_bloc/current_city_event.dart';
import 'package:weather/presentation/blocs/current_city_bloc/current_city_state.dart';

class CurrentCityBloc extends Bloc<CurrentCityEvent, CurrentCityState> {
  CurrentCityBloc({
    required this.repository,
  }) : super(
          CurrentCityState(
            status: CurrentCityStatus.loading,
          ),
        ) {
    on<FetchDataEvent>((event, emit) async {
      try {
        emit(
          state.copyWith(status: CurrentCityStatus.loading),
        );
        final location = event.location;
        final weather = await repository.fetchWeather(
          location: location,
          status: event.status,
        );
        final weekForecast = await repository.fetchWeatherForWeek(
          location: location,
          status: event.status,
        );
        final todaysWeather = await repository.fetchHourlyTodaysWeather(
          location: location,
          status: event.status,
        );

        emit(
          state.copyWith(
            weather: weather,
            todaysWeather: todaysWeather,
            weekWeather: weekForecast,
            status: CurrentCityStatus.ready,
          ),
        );
      } catch (e) {
        log(e.toString());
        emit(
          state.copyWith(
            status: CurrentCityStatus.error,
          ),
        );
      }
    });
    on<FetchDataByCoordinatesEvent>((event, emit) async {
      try {
        emit(
          state.copyWith(status: CurrentCityStatus.loading),
        );
        final lat = event.lat;
        final lon = event.lon;
        final weather = await repository.fetchWeatherByCoordinates(
          lat: lat,
          lon: lon,
          status: event.status,
        );
        final weekForecast = await repository.fetchWeatherForWeekByCoordinates(
          lat: lat,
          lon: lon,
          status: event.status,
        );
        final todaysWeather = await repository.fetchHourlyTodaysWeatherByCoordinates(
          lat: lat,
          lon: lon,
          status: event.status,
        );
        emit(
          state.copyWith(
            weather: weather,
            todaysWeather: todaysWeather,
            weekWeather: weekForecast,
            status: CurrentCityStatus.ready,
          ),
        );
      } catch (e) {
        log(e.toString());
        emit(
          state.copyWith(
            status: CurrentCityStatus.error,
          ),
        );
      }
    });
  }

  final WeatherRepository repository;

  void fetchCityWeather({
    required Location location,
    required ConnectivityStatus status,
  }) =>
      add(
        FetchDataEvent(
          location: location,
          status: status,
        ),
      );

  void fetchCityWeatherByCoordinates({
    required num lat,
    required num lon,
    required ConnectivityStatus status,
  }) =>
      add(
        FetchDataByCoordinatesEvent(
          lat: lat,
          lon: lon,
          status: status,
        ),
      );
}
