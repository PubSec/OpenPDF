import 'package:flutter/material.dart';

class PdfView extends StatelessWidget {
  const PdfView({super.key, required this.pdfWidget});
  final Widget pdfWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: SafeArea(child: pdfWidget),
    );
  }
}
