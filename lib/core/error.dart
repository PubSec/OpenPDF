import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.errorText});

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorText,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
