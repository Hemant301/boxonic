// import 'dart:io';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'dart:ui' as ui;
// import 'package:path_provider/path_provider.dart';
// import 'package:share/share.dart';

// GlobalKey previewContainer = new GlobalKey();

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       // Here we take the value from the MyHomePage object that was created by
//       // the App.build method, and use it to set our appbar title.
//       title: Text('hemu'),
//     ),
//     body: RepaintBoundary(
//       key: previewContainer,
//       child: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Take Screen Shot',
//             ),
//           ],
//         ),
//       ),
//     ),
//     floatingActionButton: FloatingActionButton(
//       onPressed: _captureSocialPng,
//       tooltip: 'Increment',
//       child: Icon(Icons.camera),
//     ), // This trailing comma makes auto-formatting nicer for                 build methods.
//   );
// }

// Future<void> _captureSocialPng() {
//   List<String> imagePaths = [];
//   final RenderBox box = context.findRenderObject() as RenderBox;
//   return new Future.delayed(const Duration(milliseconds: 20), () async {
//     RenderRepaintBoundary? boundary = previewContainer.currentContext!
//         .findRenderObject() as RenderRepaintBoundary?;
//     ui.Image image = await boundary!.toImage();
//     final directory = (await getApplicationDocumentsDirectory()).path;
//     ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//     Uint8List pngBytes = byteData!.buffer.asUint8List();
//     File imgFile = new File('$directory/screenshot.png');
//     imagePaths.add(imgFile.path);
//     imgFile.writeAsBytes(pngBytes).then((value) async {
//       await Share.shareFiles(imagePaths,
//           subject: 'Share',
//           text: 'Check this Out!',
//           sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
//     }).catchError((onError) {
//       print(onError);
//     });
//   });
// }
