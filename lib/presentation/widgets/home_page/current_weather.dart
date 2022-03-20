import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/config/app_data_converter.dart';
import 'package:weather/domain/entities/weather/weather_entity.dart';
import 'package:weather/presentation/blocs/localization_bloc/localization_bloc.dart';
import 'package:weather/presentation/blocs/localization_bloc/localization_state.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({
    Key? key,
    required this.weatherEntity,
  }) : super(key: key);

  final WeatherEntity weatherEntity;

  @override
  Widget build(BuildContext context) {
    final temp = context.read<LocalizationBloc>().state.status == LocalizationStatus.ru
        ? AppDataConverter.toCelsius(weatherEntity.main.temp)
        : AppDataConverter.toFahrenheit(weatherEntity.main.temp);

    final tempMax = context.read<LocalizationBloc>().state.status == LocalizationStatus.ru
        ? AppDataConverter.toCelsius(weatherEntity.main.tempMax)
        : AppDataConverter.toFahrenheit(weatherEntity.main.tempMax);

    final tempMin = context.read<LocalizationBloc>().state.status == LocalizationStatus.ru
        ? AppDataConverter.toCelsius(weatherEntity.main.tempMin)
        : AppDataConverter.toFahrenheit(weatherEntity.main.tempMin);

    return Column(
      children: [
        const SizedBox(
          height: 64,
        ),
        Text(
          '${temp.toStringAsFixed(0)}°',
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        Text(
          '${tempMax.toStringAsFixed(0)}° / ${tempMin.toStringAsFixed(0)}°',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          weatherEntity.weather[0].main,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        Text(
          weatherEntity.name,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
