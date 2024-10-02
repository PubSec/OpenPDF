import 'dart:io';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatefulWidget {
  const PdfView({
    super.key,
    required this.pdfFile,
    required this.pdfTitle,
  });
  final File pdfFile;
  final String pdfTitle;

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  final TextEditingController _textEditingController = TextEditingController();
  final PdfViewerController _pdfViewerController = PdfViewerController();
  String searchText = '';

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(widget.pdfTitle),
        actions: [
          AnimSearchBar(
            autoFocus: true,
            suffixIcon: const Icon(CupertinoIcons.forward),
            boxShadow: false,
            color: Colors.transparent,
            searchIconColor: Colors.white,
            width: 210,
            textController: _textEditingController,
            onSubmitted: (String searchText) {
              if (_textEditingController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Search not found.'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    behavior: SnackBarBehavior.floating,
                    dismissDirection: DismissDirection.down,
                  ),
                );
              } else {
                setState(() {
                  searchText = _textEditingController.text;
                });
                _pdfViewerController.searchText(searchText);
              }
            },
            onSuffixTap: _textEditingController.clear,
          )
        ],
      ),
      body: SfPdfViewer.file(
        controller: _pdfViewerController,
        widget.pdfFile,
        canShowTextSelectionMenu: false,
      ),
    );
  }
}
