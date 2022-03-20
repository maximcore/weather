import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get defaultTheme => ThemeData.from(
        colorScheme: const ColorScheme(
          background: Color(0xff1e1e3e),
          error: Color(0xffe33434),
          onBackground: Color(0xffffffff),
          onError: Color(0xffe33434),
          brightness: Brightness.dark,
          onSecondary: Color(0xffffffff),
          onSurface: Color(0xffffffff),
          onPrimary: Color(0xffffffff),
          primary: Color(0xffefebeb),
          secondary: Color(0xff181818),
          surface: Color(0xff000000),
          primaryContainer: Color(0xff604bde),
          secondaryContainer: Color(0xffa15333),

        ),
      );
}
