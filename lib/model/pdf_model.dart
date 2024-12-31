import 'package:flutter/material.dart';

class UserFile {
  String fileName;
  String filePath;
  Icon fileIcon = const Icon(Icons.picture_as_pdf);
  int exitPageNumber = 0;
  UserFile(this.fileIcon, this.fileName, this.exitPageNumber,
      {required this.filePath});
}
