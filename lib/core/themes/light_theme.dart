import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(const Color.fromARGB(255, 237, 222, 200)),
      iconColor: WidgetStatePropertyAll(Colors.orange),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.amber)),
  ),
  tabBarTheme: TabBarThemeData(
    dividerColor: Colors.transparent,
    indicator: BoxDecoration(
      border: Border.all(color: Colors.orange, width: 3.0),
      borderRadius: BorderRadius.circular(24.0),
    ),
    splashBorderRadius: BorderRadius.circular(24.0),
    labelColor: Colors.orange,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Colors.orange,
  ),
  inputDecorationTheme: InputDecorationThemeData(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: const Color.fromARGB(255, 243, 188, 206))
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: const Color.fromARGB(255, 253, 213, 93))
    ),
  ),
);
