import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
  ),
  colorScheme: ColorScheme.dark(
    primary: const Color.fromARGB(255, 255, 255, 255),
    secondary: Colors.grey[900]!,
    surface: Colors.black,
    onPrimary: Colors.white
  ),
);
