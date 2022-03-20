import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/config/app_data_converter.dart';
import 'package:weather/domain/entities/weather/day_weather_entity.dart';
import 'package:weather/presentation/blocs/localization_bloc/localization_bloc.dart';
import 'package:weather/presentation/blocs/localization_bloc/localization_state.dart';

class DayWeather extends StatelessWidget {
  const DayWeather({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final DayWeatherEntity weather;

  Image chooseImage() {
    late final Image image;
    switch (weather.main) {
      case 'Clouds':
        image = Image.asset(
          'lib/assets/clouds.png',
          height: 50,
          width: 50,
        );
        break;
      case 'Clear':
        image = Image.asset(
          'lib/assets/clear.png',
          height: 50,
          width: 50,
        );
        break;
      case 'Rain':
        image = Image.asset(
          'lib/assets/rain.png',
          height: 50,
          width: 50,
        );
        break;
      case 'Snow':
        image = Image.asset(
          'lib/assets/snow.png',
          height: 50,
          width: 50,
        );
        break;
      default:
        image = Image.asset(
          'lib/assets/clear.png',
          height: 50,
          width: 50,
        );
        break;
    }
    return image;
  }

  @override
  Widget build(BuildContext context) {
    final image = chooseImage();

    final day = context.read<LocalizationBloc>().state.status == LocalizationStatus.ru
        ? AppDataConverter.toCelsius(weather.dayDegrees)
        : AppDataConverter.toFahrenheit(weather.dayDegrees);

    final night = context.read<LocalizationBloc>().state.status == LocalizationStatus.ru
        ? AppDataConverter.toCelsius(weather.nightDegrees)
        : AppDataConverter.toFahrenheit(weather.nightDegrees);

    final date = DateTime.fromMillisecondsSinceEpoch(weather.msecSinceEpoch);

    final status = context.read<LocalizationBloc>().state.status;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '${AppDataConverter.weekdayFromNumber(status: status, number: date.weekday)}, ${AppDataConverter.monthFromNumber(status: status, number: date.month)} ${date.day}',
        ),
        image,
        Text(
          '${day.toStringAsFixed(0)}° / ${night.toStringAsFixed(0)}°',
        ),
      ],
    );
  }
}
