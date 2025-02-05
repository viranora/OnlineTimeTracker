import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.purple,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.purple,
    ),
    primaryColor: const Color.fromARGB(255, 160, 131, 157),
    scaffoldBackgroundColor: Colors.white,
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.purple,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
    ),
    primaryColor: const Color.fromARGB(255, 160, 131, 157),
    scaffoldBackgroundColor: const Color(0xFF121212),
  );

  static final systemTheme = ThemeData(
    primarySwatch: Colors.purple,
  );
}
