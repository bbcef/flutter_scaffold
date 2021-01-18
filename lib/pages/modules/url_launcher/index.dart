
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherPage extends StatefulWidget {
  @override
  _UrlLauncherPageState createState() => _UrlLauncherPageState();
}

class _UrlLauncherPageState extends State<UrlLauncherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('url_launcher 插件 Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
            onPressed: _launchURL,
            child: Text('浏览器demo 打开 flutter官网'),
          ),
          ],
        )
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
