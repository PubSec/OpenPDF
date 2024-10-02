import 'dart:async';

import 'package:flutter/material.dart';
import 'package:openpdf/features/display/model/pdf_model.dart';
import 'package:uni_links/uni_links.dart';

class IntentHandler extends StatefulWidget {
  const IntentHandler({super.key});

  @override
  State<IntentHandler> createState() => _IntentHandlerState();
}

class _IntentHandlerState extends State<IntentHandler> {
  // ignore: unused_field
  StreamSubscription? _sub;
  Pickedfilemodel? pickedfilemodel;

  @override
  void initState() {
    super.initState();
    _sub = linkStream.listen((String? link) {
      if (link != null) {
        pickedfilemodel?.openLocalFile(context);
        print(link);
      }
    }, onError: (err) {
      print('Error: $err');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
