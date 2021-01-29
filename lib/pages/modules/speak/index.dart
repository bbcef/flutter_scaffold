import 'package:flutter/material.dart';

class SpeakPage extends StatefulWidget {
  @override
  _SpeakPageState createState() => _SpeakPageState();
}

class _SpeakPageState extends State<SpeakPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('百度语音演示'),
        centerTitle: true,
      ),
      body: BodyCenter()
    );
  }
}

class BodyCenter extends StatefulWidget {
  @override
  _BodyCenterState createState() => _BodyCenterState();
}

class _BodyCenterState extends State<BodyCenter> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('参考项目:https://github.com/bbcef/asr_plugin_demo'),
    );
  }
}
