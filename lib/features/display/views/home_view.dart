import 'package:flutter/material.dart';
import 'package:openpdf/features/display/model/pdf_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Pickedfilemodel pickedfilemodel = Pickedfilemodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('OpenPDF'),
        actions: [
          IconButton(
            onPressed: () {
              pickedfilemodel.openLocalFile(context);
            },
            icon: const Icon(Icons.file_open_rounded),
          )
        ],
      ),
      body: const Center(
        child: Text('Open PDF with the above button'),
      ),
    );
  }
}
