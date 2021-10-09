import 'dart:io';

import 'package:download_yt/screens/download.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({Key? key}) : super(key: key);

  @override
  _BrowsePageState createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  late WebViewController _controller;

  bool flag = true;
  void check() async {
    if (await _controller.currentUrl() == 'https://m.youtube.com/') {
      setState(() {
        flag = false;
      });
    } else {
      setState(() {
        flag = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    check();
    return WillPopScope(
      onWillPop: () async {
        if (await _controller.canGoBack()) {
          _controller.goBack();
        }
        return false;
      },
      child: Scaffold(
        body: WebView(
          initialUrl: 'https://www.youtube.com',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            setState(() {
              _controller = controller;
            });
          },
        ),
        floatingActionButton: flag
            ? FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () async {
                  final url = await _controller.currentUrl();
                  print("om");
                  Download().downloadVideo(url!, "Downloading..");
                },
                child: Icon(Icons.download),
              )
            : Container(),
      ),
    );
  }
}
