import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:openpdf/features/display/views/pdf_view.dart';
import 'package:file_picker/file_picker.dart';

// Handles picking and pushing the file to a view page
class Pickedfilemodel {
  Future<void> openLocalFile(BuildContext context) async {
    PermissionStatus permStatus =
        await Permission.manageExternalStorage.request();
    if (context.mounted) {
      if (permStatus.isGranted) {
        FilePickerResult? fileResult =
            await FilePicker.platform.pickFiles(allowMultiple: false);
        print('File location: $fileResult');
        if (fileResult != null &&
            fileResult.files.single.name.endsWith('.pdf') &&
            context.mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PdfView(
                pdfFile: File(fileResult.files.single.path!),
                pdfTitle: fileResult.files.single.name.split('.')[0],
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
                  borderRadius: BorderRadius.circular(20.0),
                ),
                width: 150,
              ),
            );
          }
        }
      } else if (permStatus.isDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            dismissDirection: DismissDirection.down,
            content: const Text('Permission Denied'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        await Permission.storage.request();
      } else if (permStatus.isPermanentlyDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            behavior: SnackBarBehavior.floating,
            dismissDirection: DismissDirection.down,
            content:
                const Text("Permission permanently denied. Go to settings?"),
            action: SnackBarAction(
                label: 'Settings',
                onPressed: () {
                  openAppSettings();
                }),
          ),
        );
      }
    }
  }
}
