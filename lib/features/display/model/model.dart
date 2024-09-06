import 'dart:io';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:openpdf/features/display/views/pdf_view.dart';
import 'package:file_picker/file_picker.dart';

class FileModel {
  final String fileName;
  final int fileSize;
  final String filePath;
  final String? filePreview = '';

  FileModel({
    required this.fileName,
    required this.fileSize,
    required this.filePath,
  });
  // Checks the file and opens it
  Future<void> openFile(dynamic context, FilePickerResult? fileResult) async {
    if (fileResult != null) {
      print(" ****** $fileResult *******");
      // Get the file path
      String? filePath = fileResult.files.single.path;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PdfView(
            pdfWidget: SfPdfViewer.file(File(filePath!)),
            appBarTitle: fileResult.files.single.name.split('.')[0],
          ),
        ),
      );
    } else if (fileResult == null) {
      // TODO: Doesn't show anything. Fix
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('File'),
            content: const Text('No file selected.'),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
