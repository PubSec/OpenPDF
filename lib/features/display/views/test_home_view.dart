// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// // import 'package:permission_handler/permission_handler.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'PDF Scanner',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ScanButtonWidget(),
//     );
//   }
// }

// class ScanButtonWidget extends StatefulWidget {
//   const ScanButtonWidget({super.key});

//   @override
//   _ScanButtonWidgetState createState() => _ScanButtonWidgetState();
// }

// class _ScanButtonWidgetState extends State<ScanButtonWidget> {
//   List<File>? pdfFiles;
//   bool isScanning = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('PDF Scanner'),
//       ),
//       body: Center(
//         child: isScanning
//             ? const CircularProgressIndicator()
//             : pdfFiles != null
//                 ? ListView.builder(
//                     itemCount: pdfFiles!.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text(pdfFiles![index].path),
//                       );
//                     },
//                   )
//                 : const Text('No PDFs found'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await requestPermissions();
//           if (await Permission.storage.isGranted) {
//             setState(() {
//               isScanning = true;
//             });
//             try {
//               pdfFiles = await scanForPdfs();
//               if (pdfFiles!.isEmpty) {
//                 print("No PDF files found.");
//               }
//             } catch (e) {
//               print("Error scanning PDFs: $e");
//             } finally {
//               setState(() {
//                 isScanning = false;
//               });
//             }
//           } else {
//             print("Storage permission is not granted");
//           }
//         },
//         child: const Icon(Icons.search),
//       ),
//     );
//   }

//   Future<void> requestPermissions() async {
//     // final status = await Permission.manageExternalStorage.request();
//     if (!status.isGranted) {
//       print("Storage permission is not granted");
//     } else {
//       print("Storage permission granted");
//     }
//   }

//   Future<List<File>> scanForPdfs() async {
//     List<File> pdfFiles = [];
//     try {
//       final homeDir = await getExternalStorageDirectory();

//       if (homeDir != null) {
//         await _scanDirectory(homeDir, pdfFiles);
//       } else {
//         print("Home directory is null");
//       }
//     } catch (e) {
//       print("Error accessing external storage directory: $e");
//     }
//     return pdfFiles;
//   }

//   Future<void> _scanDirectory(Directory directory, List<File> pdfFiles) async {
//     try {
//       final List<FileSystemEntity> entities =
//           directory.listSync(recursive: true);
//       for (var entity in entities) {
//         if (entity is File && entity.path.endsWith('.pdf')) {
//           pdfFiles.add(entity);
//           print(pdfFiles);
//         }
//       }
//     } catch (e) {
//       print("Error scanning directory: $e");
//     }
//   }
// }
