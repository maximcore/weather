import 'package:flutter/material.dart';
import 'package:weather/config/app_bloc_wrapper.dart';
import 'package:weather/config/theme.dart';
import 'package:weather/pages/home_page.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppBlocWrapper(
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      home: const HomePage(),
    );
  }
}
