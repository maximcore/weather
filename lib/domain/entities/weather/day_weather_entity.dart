class DayWeatherEntity {
  DayWeatherEntity({
    required this.dayDegrees,
    required this.nightDegrees,
    required this.msecSinceEpoch,
    required this.feelsLikeDegrees,
    required this.main,
  });

  final num dayDegrees;
  final num nightDegrees;
  final num feelsLikeDegrees;
  final int msecSinceEpoch;

  // main - Group of weather parameters (Rain, Snow, Extreme etc.)
  final String main;
}
