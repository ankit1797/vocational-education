import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewLoad extends StatefulWidget {
  final String url;

  const WebViewLoad({Key key, this.url}) : super(key: key);

  WebViewLoadUI createState() => WebViewLoadUI();
}

class WebViewLoadUI extends State<WebViewLoad> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      //  appBar: AppBar(
      //     title: Text('WebView in Flutter')),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, statusBarHeight, 0, 0),
        child: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('https://codelabs.developers.google.com/codelabs/')) {
              return NavigationDecision.navigate;
            }
            print('blocking navigation to $request}');
            return NavigationDecision.prevent;
          },
        ),
      ),
    );
  }
}
