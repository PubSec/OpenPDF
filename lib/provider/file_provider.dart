import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openpdf/model/pdf_model.dart';
import 'package:permission_handler/permission_handler.dart';

class FileNotifier extends Notifier<Future<List<PdfFileModel>>> {
  @override
  Future<List<PdfFileModel>> build() async {
    return await baseDirectory();
  }

  String extractFileName(String filePath) {
    if (filePath.endsWith('.pdf')) {
      String name = filePath.split('/').last;
      if (name.contains('.')) {
        int lastPointIndex = name.lastIndexOf('.');
        name = name.substring(0, lastPointIndex);
      }
      return name;
    } else {
      return 'Unable to get file name';
    }
  }

  Future<List<PdfFileModel>> baseDirectory() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    if (androidDeviceInfo.version.sdkInt < 30) {
      PermissionStatus permissionStatus = await Permission.storage.request();
      if (permissionStatus.isGranted) {
        var rootDirectory = await ExternalPath.getExternalStorageDirectories();
        List<String> files = await getFiles(rootDirectory.first);
        List<PdfFileModel> pdfFiles = files
            .map(
              (filePath) => PdfFileModel(
                  fileName: extractFileName(filePath), filePath: filePath),
            )
            .toList();
        return pdfFiles;
      } else {
        // Handle permission denied case

        return [];
      }
    } else {
      PermissionStatus permissionStatus =
          await Permission.manageExternalStorage.request();
      if (permissionStatus.isGranted) {
        var rootDirectory = await ExternalPath.getExternalStorageDirectories();
        List<String> files = await getFiles(rootDirectory.first);
        List<PdfFileModel> pdfFiles = files
            .map(
              (filePath) => PdfFileModel(
                  fileName: extractFileName(filePath), filePath: filePath),
            )
            .toList();
        return pdfFiles;
      } else {
        // Handle permission denied case
        return [];
      }
    }
  }

  Future<List<String>> getFiles(String directoryPath) async {
    List<String> pdfFilePath = [];
    try {
      var rootDirectory = Directory(directoryPath);
      var directories = rootDirectory.list(recursive: false);
      await for (var element in directories) {
        if (element is File) {
          if (element.path.split(".").last == "pdf") {
            pdfFilePath.add(element.path);
          }
        } else if (element is Directory) {
          pdfFilePath.addAll(await getFiles(element.path));
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return pdfFilePath;
  }
}

final fileNotifierProvider =
    NotifierProvider<FileNotifier, Future<List<PdfFileModel>>>(() {
  return FileNotifier();
});
