import 'package:flutter/material.dart';
import 'package:openpdf/core/theme/theme_data.dart';
import 'package:openpdf/features/display/views/home_view.dart';

// TODO: Show in 'Open with' options
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
