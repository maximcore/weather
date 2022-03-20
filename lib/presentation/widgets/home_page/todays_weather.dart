import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/config/app_data_converter.dart';
import 'package:weather/domain/entities/weather/todays_weather_entity.dart';
import 'package:weather/presentation/blocs/localization_bloc/localization_bloc.dart';
import 'package:weather/presentation/blocs/localization_bloc/localization_state.dart';

class TodaysWeather extends StatelessWidget {
  const TodaysWeather({
    Key? key,
    required this.todaysWeatherEntity,
  }) : super(key: key);

  final TodaysWeatherEntity todaysWeatherEntity;

  Image chooseImage() {
    late final Image image;
    switch (todaysWeatherEntity.main) {
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
    final hours = AppDataConverter.timeFromDatetime(
        DateTime.fromMillisecondsSinceEpoch(todaysWeatherEntity.time));

    final degrees = context.read<LocalizationBloc>().state.status == LocalizationStatus.ru
        ? AppDataConverter.toCelsius(todaysWeatherEntity.degrees)
        : AppDataConverter.toFahrenheit(todaysWeatherEntity.degrees);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(hours),
        image,
        Text('${degrees.toStringAsFixed(0)}°'),
      ],
    );
  }
}
