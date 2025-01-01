import 'package:flutter/material.dart';

class PdfFileModel {
  String fileName;
  String filePath;
  Icon fileIcon = const Icon(Icons.picture_as_pdf);
  // int exitPageNumber = 0;
  PdfFileModel({required this.fileName, required this.filePath});
}
