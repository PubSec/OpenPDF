import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:openpdf/features/display/model/model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Recent'),
        actions: [
          IconButton(
            onPressed: () async {
              FilePickerResult? fileResult =
                  await FilePicker.platform.pickFiles();
              PickedFileModel(
                fileName: fileResult!.files.single.name,
                filePath: fileResult.files.single.path!,
              ).openFile(context, fileResult);
            },
            icon: const Icon(Icons.file_open_rounded),
          )
        ],
      ),
      body: const Center(child: Text('Under Construction!')),
    );
  }
}
