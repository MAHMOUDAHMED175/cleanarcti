import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class web extends StatefulWidget {
  web({super.key,required this.url});
  String url;

  @override
  State<web> createState() => _webState();
}

class _webState extends State<web> {

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    String convertToHttps(String url) {
      if (url.startsWith('http://')) {
        return 'https://' + url.substring(7);
      }
      return url;
    }
    String httpsUrl = convertToHttps(widget.url);

    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("View Book",style: TextStyle(color: Colors.white),),
      ),
      body: WebView(
        initialUrl:httpsUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onProgress: (int progress) {
          print('WebView is loading (progress : $progress%)');
        },
        javascriptChannels: <JavascriptChannel>{
          _toasterJavascriptChannel(context),
        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('https://www.google.com/')) {
            print('blocking navigation to $request}');
            return NavigationDecision.prevent;
          }
          print('allowing navigation to $request');
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
        gestureNavigationEnabled: true,
        backgroundColor: const Color(0x00000000),
      ),
    );
  }
}
