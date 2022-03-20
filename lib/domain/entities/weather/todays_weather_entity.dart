class TodaysWeatherEntity {
  TodaysWeatherEntity({
    required this.time,
    required this.degrees,
    required this.main,
  });

  final int time;
  final num degrees;
  final String main;
}
