import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatefulWidget {
  const Webview({Key? key}) : super(key: key);

  @override
  State<Webview> createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  bool progressBar = true;

  // activeIndex=0
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
        ),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: rcvdData['url'],
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (s) {
              setState(() {
                progressBar = false;
              });
            },
          ),
          progressBar == true
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.green,
                ))
              : Container()
        ],
      ),
    );
  }
}
