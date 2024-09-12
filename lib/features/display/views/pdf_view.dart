import 'package:flutter/material.dart';

class PdfView extends StatefulWidget {
  const PdfView(
      {super.key, required this.pdfWidget, required this.appBarTitle});
  final Widget pdfWidget;
  final String appBarTitle;

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(widget.appBarTitle),
      ),
      body: SafeArea(child: widget.pdfWidget),
    );
  }
}
