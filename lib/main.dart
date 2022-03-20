import 'package:flutter/material.dart';
import 'package:weather/injector.dart';
import 'package:weather/weather_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(
    const WeatherApp(),
  );
}
