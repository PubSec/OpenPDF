import 'package:flutter/material.dart';
import 'package:openpdf/core/theme/theme_data.dart';
import 'package:openpdf/features/display/views/home_view.dart';

// TODO: Show in 'Open with' options
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
