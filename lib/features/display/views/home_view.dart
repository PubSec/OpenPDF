import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:openpdf/features/display/model/model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Recent'),
        actions: [
          IconButton(
            icon: const Icon(Icons.file_open),
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();
              FileModel fileModel = FileModel(
                fileName: result!.files.single.name,
                fileSize: result.files.single.size,
                filePath: result.files.single.path!,
              );

              print(
                  "**** ${fileModel.fileName} ${fileModel.fileSize} ${fileModel.filePath} *****");
              if (context.mounted) {
                fileModel.openFile(context, result);
              }
            },
          ),
        ],
      ),
      body: const Text('Hello'),
    );
  }
}
