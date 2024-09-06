import 'package:flutter/material.dart';

class FileModel {
  final String fileName;
  final int fileSize;
  final String filePath;
  final Image? filePreview;

  FileModel({
    required this.fileName,
    required this.fileSize,
    required this.filePath,
    this.filePreview,
  });
}
