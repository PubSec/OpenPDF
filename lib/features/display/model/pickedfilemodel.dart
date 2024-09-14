import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:openpdf/features/display/views/pdf_view.dart';
import 'package:file_picker/file_picker.dart';

// Handles picking and pushing the file to a view page
Future<void> openFile(BuildContext context) async {
  FilePickerResult? fileResult =
      await FilePicker.platform.pickFiles(allowMultiple: false);
  if (context.mounted) {
    PermissionStatus permStatus = await Permission.storage.request();
    if (permStatus.isGranted) {
      if (fileResult != null && fileResult.files.single.name.endsWith('.pdf')) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PdfView(
              pdfWidget: SfPdfViewer.file(File(fileResult.files.single.path!)),
              appBarTitle: fileResult.files.single.name.split('.')[0],
            ),
          ),
        );
      } else if (!fileResult!.files.single.name.endsWith('.pdf')) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Unable to open ${fileResult.files.single.name}'),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }
      }
    } else if (permStatus.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Storage access is denied.'),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ));
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
