import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:openpdf/features/display/views/pdf_view.dart';
import 'package:file_picker/file_picker.dart';

class PickedFileModel {
  final String fileName;
  final String filePath;
  PickedFileModel({
    required this.fileName,
    required this.filePath,
  });
// Handles picking and pushing the file to a view page
  Future<void> openFile(dynamic context, FilePickerResult? fileResult) async {
    permissionChecker(context);
    if (fileResult != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PdfView(
            pdfWidget: SfPdfViewer.file(File(filePath)),
            appBarTitle: fileName.split('.')[0],
          ),
        ),
      );
    }
  }

// Handles Permissions
//TODO: Change the Permission to storage or check if it works for all devices.
  Future<void> permissionChecker(BuildContext context) async {
    final permissionStatus = await Permission.storage.request();
    if (!permissionStatus.isGranted) {
      await Permission.storage.request();
    } else if (permissionStatus.isPermanentlyDenied) {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Permission Denied'),
              content: const Text('Go to setting and change permssions?'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Settings'),
                  onPressed: () {
                    openAppSettings();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }
}
