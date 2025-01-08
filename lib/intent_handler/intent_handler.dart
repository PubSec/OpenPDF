// import 'package:app_links/app_links.dart';
// import 'package:flutter/material.dart';
// import 'package:openpdf/model/pdf_model.dart';
// import 'package:openpdf/views/pdf_view.dart';

// class IntentHandler extends StatefulWidget {
//   const IntentHandler({super.key});

//   @override
//   State<IntentHandler> createState() => _IntentHandlerState();
// }

// class _IntentHandlerState extends State<IntentHandler> {
//   final appLinks = AppLinks();

//   @override
//   Widget build(BuildContext context) {
//     appLinks.uriLinkStream.listen(
//       (Uri uri) {
//         print("*****$uri*****");
//         uri.toString().split('//');
//         print("*****$uri*****");
//         final file = PdfFileModel(
//             fileName: "${uri.toString().length}", filePath: uri.toString());
//         if (mounted) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => PdfView(pdfFile: file),
//             ),
//           );
//         }
//       },
//       cancelOnError: true,
//     );

//     return const Scaffold(
//       body: Center(child: Text('Listening for PDF links...')),
//     );
//   }
// }

import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:openpdf/model/pdf_model.dart';
import 'package:openpdf/views/pdf_view.dart';

class IntentHandler extends StatefulWidget {
  const IntentHandler({super.key});

  @override
  State<IntentHandler> createState() => _IntentHandlerState();
}

class _IntentHandlerState extends State<IntentHandler> {
  StreamSubscription<Uri>? _uriLinkSubscription;
  final AppLinks appLinks = AppLinks();

  @override
  void initState() {
    super.initState();
    _initAppLinks();
  }

  Future<void> _initAppLinks() async {
    // Check for the initial URI
    try {
      final initialUri = await appLinks.getInitialLink();
      if (initialUri != null) {
        _handleUri(initialUri);
      }
    } catch (e) {
      print('Error getting initial URI: $e');
    }

    // Listen for incoming links
    _uriLinkSubscription = appLinks.uriLinkStream.listen(
      (Uri? uri) {
        if (uri != null) {
          _handleUri(uri);
        }
      },
      onError: (err) {
        print('Error: $err');
      },
    );
  }

  void _handleUri(Uri uri) {
    print("***** Received URI: $uri *****");
    final file = PdfFileModel(
      fileName: "${uri.toString().length}",
      filePath: uri.toString(),
    );

    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PdfView(pdfFile: file),
        ),
      );
    }
  }

  @override
  void dispose() {
    _uriLinkSubscription?.cancel(); // Cancel the subscription
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Listening for PDF links...')),
    );
  }
}
