import 'package:flutter/cupertino.dart';

class PdfFileModel {
  String fileName;
  String filePath;
  Icon fileIcon = const Icon(CupertinoIcons.doc_circle);
  // int exitPageNumber = 0;
  PdfFileModel({required this.fileName, required this.filePath});
}
