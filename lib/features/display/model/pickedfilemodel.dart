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
  Future<void> openFile(
      BuildContext context, FilePickerResult? fileResult) async {
    if (context.mounted) {
      PermissionStatus permStatus =
          await Permission.manageExternalStorage.request();
      if (permStatus.isGranted) {
        if (fileResult != null && fileName.endsWith('.pdf')) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PdfView(
                pdfWidget: SfPdfViewer.file(File(filePath)),
                appBarTitle: fileName.split('.')[0],
              ),
            ),
          );
        } else if (!fileName.endsWith('.pdf')) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Unable to open $fileName'),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            );
          }
        }
      } else if (permStatus.isDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Storage access is denied.')));

        await Permission.storage.request();
      } else if (permStatus.isPermanentlyDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
                'Storage access is permanently denied. Go to settings?'),
            action: SnackBarAction(
              label: 'Settings',
              onPressed: () {
                openAppSettings();
              },
            ),
          ),
        );
      }
    }
  }
}
