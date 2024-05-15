import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData themeData = ThemeData(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: kPrimaryColor,
    appBarTheme: const AppBarTheme(backgroundColor: kDetailColor),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: kDetailColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kDetailColor,
        textStyle: const TextStyle(
          color: kLightColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(surface: kPrimaryColor),
  );
}
