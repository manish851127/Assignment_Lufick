import 'package:flutter/material.dart';

class AppColors {
  static Color acccent = const Color(0xff1ab7c3);
  static Color text = Color.fromARGB(255, 58, 58, 58);
  static Color textLight = Color.fromARGB(255, 77, 77, 77);
  static Color white = Color.fromARGB(255, 255, 255, 255);
}

class Themes {
  static ThemeData defaultTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        primary: AppColors.acccent, secondary: AppColors.acccent),
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.white,
        titleTextStyle: TextStyle(fontSize: 18, color: AppColors.text)),
    iconTheme: IconThemeData(
      color: AppColors.text,
    ),
  );
}

class TextStyles {
  static TextStyle heading1 = TextStyle(
      color: AppColors.text, fontSize: 32, fontWeight: FontWeight.bold);
  static TextStyle heading2 = TextStyle(
      color: AppColors.text, fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle heading3 = TextStyle(
      color: AppColors.text, fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle body1 = TextStyle(
      color: AppColors.text, fontSize: 16, fontWeight: FontWeight.normal);
  static TextStyle body2 = TextStyle(
      color: AppColors.text, fontSize: 14, fontWeight: FontWeight.normal);
}
