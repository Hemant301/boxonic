import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatelessWidget {
  const PdfView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    print(rcvdData['url']);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: lightWhite2,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(
            rcvdData['title'],
            style: TextStyle(color: Colors.black),
          )),
      body: SfPdfViewer.network(
        rcvdData['url'],
        // key: _pdfViewerKey,
      ),
    );
  }
}
