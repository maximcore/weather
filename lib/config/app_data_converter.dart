import 'package:weather/presentation/blocs/localization_bloc/localization_state.dart';

class AppDataConverter {
  static int toCelsius(num number) {
    return number.floor() - 273;
  }

  static double toFahrenheit(num number) {
    final kelvin = number.floor();
    return 1.8 * (kelvin - 273) + 32;
  }

  static String timeFromDatetime(DateTime time) {
    return '${time.hour}:00';
  }

  static String weekdayFromNumber({
    required num number,
    required LocalizationStatus status,
  }) {
    String result = '';
    if (status == LocalizationStatus.eng) {
      switch (number) {
        case 1:
          result = 'Mon';
          break;
        case 2:
          result = 'Tue';
          break;
        case 3:
          result = 'Wed';
          break;
        case 4:
          result = 'Thu';
          break;
        case 5:
          result = 'Fri';
          break;
        case 6:
          result = 'Sat';
          break;
        case 7:
          result = 'Sun';
          break;
      }
    } else {
      switch (number) {
        case 1:
          result = 'Пон';
          break;
        case 2:
          result = 'Вто';
          break;
        case 3:
          result = 'Сре';
          break;
        case 4:
          result = 'Чет';
          break;
        case 5:
          result = 'Пят';
          break;
        case 6:
          result = 'Суб';
          break;
        case 7:
          result = 'Вос';
          break;
      }
    }
    return result;
  }

  static String monthFromNumber({
    required num number,
    required LocalizationStatus status,
  }) {
    String result = '';
    if (status == LocalizationStatus.eng) {
      switch (number) {
        case 1:
          result = 'Jan';
          break;
        case 2:
          result = 'Feb';
          break;
        case 3:
          result = 'Mar';
          break;
        case 4:
          result = 'Apr';
          break;
        case 5:
          result = 'May';
          break;
        case 6:
          result = 'Jun';
          break;
        case 7:
          result = 'Jul';
          break;
        case 8:
          result = 'Aug';
          break;
        case 9:
          result = 'Sep';
          break;
        case 10:
          result = 'Oct';
          break;
        case 11:
          result = 'Nov';
          break;
        case 12:
          result = 'Dec';
          break;
      }
    } else {
      switch (number) {
        case 1:
          result = 'Янв';
          break;
        case 2:
          result = 'Фев';
          break;
        case 3:
          result = 'Мар';
          break;
        case 4:
          result = 'Апр';
          break;
        case 5:
          result = 'Май';
          break;
        case 6:
          result = 'Июн';
          break;
        case 7:
          result = 'Июл';
          break;
        case 8:
          result = 'Авг';
          break;
        case 9:
          result = 'Сен';
          break;
        case 10:
          result = 'Окт';
          break;
        case 11:
          result = 'Ноя';
          break;
        case 12:
          result = 'Дек';
          break;
      }
    }
    return result;
  }
}