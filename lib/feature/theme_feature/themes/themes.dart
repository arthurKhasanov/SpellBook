import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Montserrat',
    backgroundColor: AppColors.lightBg,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBg,
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromRGBO(215, 57, 101, 1),
      onPrimary: Color.fromARGB(221, 25, 25, 25),
      secondary: Color.fromRGBO(215, 57, 101, 1),
      onSecondary: Color.fromARGB(255, 255, 255, 255),
      error: Color.fromARGB(255, 240, 37, 23),
      onError: Color.fromARGB(255, 255, 255, 255),
      background: Color.fromARGB(255, 255, 255, 255),
      onBackground: Color.fromARGB(221, 25, 25, 25),
      surface: Color.fromARGB(255, 255, 255, 255),
      onSurface: Color.fromRGBO(215, 57, 101, 1),
      shadow: Color.fromARGB(221, 25, 25, 25),
    ),
    inputDecorationTheme: InputDecorationTheme(
      // border: InputBorder(borderSide: )
    ),

  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Montserrat',
    backgroundColor: AppColors.inputBgDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.inputBgDark,
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromRGBO(215, 57, 101, 1),
      onPrimary: Color.fromARGB(255, 255, 255, 255),
      secondary: Color.fromRGBO(215, 57, 101, 1),
      onSecondary: Color.fromARGB(255, 34, 34, 34),
      error: Color.fromARGB(255, 240, 37, 23),
      onError: Color.fromARGB(255, 34, 34, 34),
      background: Color.fromARGB(255, 48, 48, 48),
      onBackground: Color.fromARGB(255, 255, 255, 255),
      surface: Color.fromARGB(255, 255, 255, 255),
      onSurface: Color.fromARGB(255, 255, 255, 255),
      shadow: Color.fromARGB(221, 247, 247, 247),
    ),
  );
}

class AppColors {
  static Color primary = const Color.fromRGBO(215, 57, 101, 1);
  static Color lightBg = const Color.fromARGB(255, 255, 255, 255);
  static Color darkBg = const Color.fromARGB(255, 34, 34, 34);
  static Color inputBgLight = const Color.fromARGB(255, 34, 34, 34);
  static Color inputBgDark = const Color.fromARGB(255, 34, 34, 34);
}
