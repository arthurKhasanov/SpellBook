import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spellbook/constants/sp_constants.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this._sharedPreferences) : super(ThemeMode.light) {
    initState();
  }

  final SharedPreferences _sharedPreferences;
  String? themeMode;

  void initState() {
    themeMode = _sharedPreferences.getString(SharedPrefsConstants.kTheme);

    if (themeMode != null) {
      if (themeMode == SharedPrefsConstants.kLightTheme) {
        emit(ThemeMode.light);
      } else {
        emit(ThemeMode.dark);
      }
    } else {
      emit(ThemeMode.system);
    }
  }

  void changeTheme() {
    Brightness brightness = WidgetsBinding.instance.window.platformBrightness;

    if (themeMode != null) {
      if (themeMode == SharedPrefsConstants.kLightTheme) {
        debugPrint('emit(ThemeMode.dark)');
        themeMode = SharedPrefsConstants.kDarkTheme;
        _sharedPreferences.setString(SharedPrefsConstants.kTheme, themeMode!);
        emit(ThemeMode.dark);
      } else {
        debugPrint('emit(ThemeMode.light)');
        themeMode = SharedPrefsConstants.kLightTheme;
        _sharedPreferences.setString(SharedPrefsConstants.kTheme, themeMode!);
        emit(ThemeMode.light);
      }
    } else {
      if (brightness == Brightness.light) {
        debugPrint('emit(ThemeMode.dark)');
        themeMode = SharedPrefsConstants.kDarkTheme;
        _sharedPreferences.setString(SharedPrefsConstants.kTheme, themeMode!);
        emit(ThemeMode.dark);
      } else {
        debugPrint('emit(ThemeMode.light)');
        themeMode = SharedPrefsConstants.kLightTheme;
        _sharedPreferences.setString(SharedPrefsConstants.kTheme, themeMode!);
        emit(ThemeMode.light);
      }
    }
  }
}
