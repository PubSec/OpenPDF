import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: const Color.fromARGB(255, 209, 207, 207),
    primary: Colors.lightGreen.shade700,
    secondary: Colors.lightGreen.shade700,
  ),
  useMaterial3: true,
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade800,
    primary: Colors.lightGreen.shade700,
    secondary: Colors.lightGreen.shade700,
  ),
  useMaterial3: true,
);
