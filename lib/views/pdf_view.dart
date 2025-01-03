import 'package:flutter/material.dart';
import 'package:openpdf/model/pdf_model.dart';
import 'package:pdfrx/pdfrx.dart';

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
  final PdfViewerController _pdfViewerController = PdfViewerController();

  @override
  void initState() {
    _textEditingController;
    _pdfViewerController;
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController;
    _pdfViewerController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(20, 30),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            maxLines: 1,
            widget.pdfFile.fileName.length > 10
                ? '${widget.pdfFile.fileName.substring(0, 11)}...'
                : widget.pdfFile.fileName,
            softWrap: true,
            style: TextStyle(fontSize: 15, overflow: TextOverflow.ellipsis),
          ),
        ),
      ),
      body: PdfViewer.file(
        controller: _pdfViewerController,
        params: PdfViewerParams(
          enableTextSelection: true,
        ),
        widget.pdfFile.filePath,
      ),
    );
  }
}
