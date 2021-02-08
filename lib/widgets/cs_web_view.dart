import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CsWebView extends StatefulWidget {
  final String title;
  final String url;
  const CsWebView({
    Key key,
    @required this.url,
    this.title = "web_view",
  }) : super(key: key);

  @override
  _CsWebViewState createState() => _CsWebViewState();
}

class _CsWebViewState extends State<CsWebView> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (context, snapshot) {
          return WillPopScope(
            onWillPop: () async {
              if (snapshot.hasData) {
                bool canGoBack = await snapshot.data.canGoBack();
                if (canGoBack) {
                  // 网页可以返回时，优先返回上一页
                  snapshot.data.goBack();
                  return Future.value(false);
                }
                return Future.value(true);
              }
              return Future.value(true);
            },
            child: Scaffold(
                appBar: AppBar(
                  title: Text(widget.title, style: TextStyle(fontSize: 18.0, color: Colors.white)),
                  // actions: [
                  //   IconButton(
                  //     icon: Icon(Icons.more_horiz),
                  //     onPressed: (){
                        
                  //     },
                  //   )
                  // ]
                ),
                body: WebView(
                  //要显示的url
                  initialUrl: widget.url,
                  //JS执行模式 是否允许JS执行
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller.complete(webViewController);
                  },
                )),
          );
        });
  }
}
