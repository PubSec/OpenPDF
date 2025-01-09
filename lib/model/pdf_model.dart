import 'package:flutter/cupertino.dart';

class PdfFileModel {
  String fileName;
  String filePath;
  Icon fileIcon = const Icon(CupertinoIcons.doc_fill);
  // int exitPageNumber = 0;
  PdfFileModel({required this.fileName, required this.filePath});
}
