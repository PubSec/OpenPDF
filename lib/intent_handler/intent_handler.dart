import 'dart:async';
import 'package:flutter/material.dart';

class IntentHandler extends StatefulWidget {
  const IntentHandler({super.key});

  @override
  State<IntentHandler> createState() => _IntentHandlerState();
}

class _IntentHandlerState extends State<IntentHandler> {
  // ignore: unused_field
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    // _sub = linkStream.listen((String? link) {
    //   if (link != null) {
    //     pickedfilemodel?.openLocalFile(context);
    //     print(link);
    //   }
    // }, onError: (err) {
    //   print('Error: $err');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
