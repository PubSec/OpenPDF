import 'package:flutter/material.dart';
import 'package:openpdf/model/pdf_model.dart';
import 'package:pdfrx/pdfrx.dart';
// import 'package:pdfrx/src/pdfium/pdfium_bindings.dart';

class PdfView extends StatefulWidget {
  const PdfView({
    super.key,
    required this.pdfFile,
  });
  final PdfFileModel pdfFile;

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  final TextEditingController _textEditingController = TextEditingController();
  // final PdfViewerController _pdfViewerController = PdfViewerController();
  String searchText = '';

  @override
  void initState() {
    _textEditingController;
    // _pdfViewerController;
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController;
    // _pdfViewerController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: PdfViewer.file(
        widget.pdfFile.filePath,
      ),
    );
  }
}
