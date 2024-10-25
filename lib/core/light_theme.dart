import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black,fontSize: 20),
  ),
  colorScheme: ColorScheme.light(
    primary: Color.fromARGB(255, 52, 52, 54),
    secondary: Colors.grey[200]!,
    surface: Colors.grey[300]!,
    onPrimary: const Color.fromARGB(255, 44, 44, 44)


  ),
);
