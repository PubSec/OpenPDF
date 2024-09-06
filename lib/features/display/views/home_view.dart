import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:openpdf/features/display/views/pdf_view.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<void> pickAndOpenFile() async {
    // Use FilePicker to pick a file
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // Get the file path
      String? filePath = result.files.single.path;
      if (filePath != null) {
        if (context.mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PdfView(
                pdfWidget: SfPdfViewer.file(File(filePath)),
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Recent'),
        actions: [
          IconButton(
            icon: const Icon(Icons.file_open),
            onPressed: pickAndOpenFile,
          ),
        ],
      ),
      body: const Text('Hello'),
    );
  }
}
