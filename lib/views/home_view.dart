import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openpdf/model/pdf_model.dart';
import 'package:openpdf/provider/file_provider.dart';
import 'package:openpdf/views/pdf_view.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    var allPdfs = ref.watch(fileNotifierProvider.notifier).baseDirectory();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('OpenPDF'),
      ),
      body: FutureBuilder(
        future: allPdfs,
        builder: (context, snapshot) {
          if (ConnectionState.waiting == snapshot.connectionState) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No files found.'));
          } else {
            List<PdfFileModel> files = snapshot.data!;
            return ListView.builder(
              cacheExtent: (files.length / 2),
              itemCount: files.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: files[index].fileIcon,
                  title: Text(files[index].fileName),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PdfView(
                          pdfFile: files[index],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
