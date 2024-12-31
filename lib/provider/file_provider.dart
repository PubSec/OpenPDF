import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class FileNotifier extends Notifier<Future<dynamic>> {
  @override
  build() {
    return Future.value(['']);
  }

  baseDirectory() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    if (androidDeviceInfo.version.sdkInt < 30) {
      PermissionStatus permissionStatus = await Permission.storage.request();
      if (permissionStatus.isGranted) {
        var rootDirectory = await ExternalPath.getExternalStorageDirectories();
        await getFiles(rootDirectory.first);
      }
    } else {
      PermissionStatus permissionStatus =
          await Permission.manageExternalStorage.request();
      if (permissionStatus.isGranted) {
        var rootDirectory = await ExternalPath.getExternalStorageDirectories();
        await getFiles(rootDirectory.first);
      }
    }
  }

  Future<dynamic> getFiles(String directoryPath) async {
    List<String> pdfFilePath = [''];

    try {
      var rootDirectory = Directory(directoryPath);
      var directories = rootDirectory.list(recursive: false);
      directories.forEach((element) {
        if (element is File) {
          if (element.path.split(".").last == "pdf") {
            pdfFilePath.add(element.path);
          }
        } else {
          getFiles(element.path);
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
    return pdfFilePath;
  }
}

final fileNotifierProvider =
    NotifierProvider<FileNotifier, Future<dynamic>>(() {
  return FileNotifier();
});
