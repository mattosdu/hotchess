import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey[50],
  primarySwatch: Colors.green,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: Colors.green,
  accentColor: Colors.green,
  dividerColor: Colors.white,
  bottomAppBarColor: Colors.green,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Colors.red,
    backgroundColor: Colors.red,
  ),
  switchTheme: SwitchThemeData(
    splashRadius: 2,
  ),
);

final darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey[700],
  primarySwatch: Colors.green,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: Colors.black87,
  accentColor: Colors.green,
  dividerColor: Colors.white,
  bottomAppBarColor: Colors.black87,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Colors.red,
    backgroundColor: Colors.red,
  ),
  switchTheme: SwitchThemeData(
    splashRadius: 6,
  ),
);
