import 'package:flutter/material.dart';

class PdfView extends StatelessWidget {
  const PdfView(
      {super.key, required this.pdfWidget, required this.appBarTitle});
  final Widget pdfWidget;
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(appBarTitle),
      ),
      body: SafeArea(child: pdfWidget),
    );
  }
}
