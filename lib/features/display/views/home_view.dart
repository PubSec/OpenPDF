import 'dart:io';
import 'package:flutter/material.dart';
import 'package:openpdf/features/display/model/pickedfilemodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<File>? pdfFiles;
  bool isScanning = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('OpenPDF'),
        actions: [
          IconButton(
            onPressed: () {
              openFile(context);
            },
            icon: const Icon(Icons.file_open_rounded),
          )
        ],
      ),
      body: const Center(
        child: Text('Open a PDF by the pressing the icon above'),
      ),
    );
  }
}
