import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openpdf/provider/file_provider.dart';

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
        actions: [
          IconButton(
            onPressed: () {
              ref.watch(fileNotifierProvider.notifier).baseDirectory();
            },
            icon: const Icon(Icons.abc),
          )
        ],
        centerTitle: true,
        title: const Text('OpenPDF'),
      ),
      body: FutureBuilder(
        future: allPdfs,
        builder: (context, snapshot) {
          if (snapshot.data == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No episodes found.'));
          } else {
            dynamic files = snapshot.data;
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(files[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
