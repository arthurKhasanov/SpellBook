import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Montserrat',
    backgroundColor: AppColors.lightBg,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBg,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Montserrat',
    backgroundColor: AppColors.inputBgDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.inputBgDark,
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
