import 'package:flutter/material.dart';


class AmapFlutterMapPage extends StatefulWidget {
  @override
  _AmapFlutterMapPageState createState() => _AmapFlutterMapPageState();
}

class _AmapFlutterMapPageState extends State<AmapFlutterMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('高德地图演示'),
        centerTitle: true,
      ),
      body: AllMapConfigDemoPage()
    );
  }
}

class AllMapConfigDemoPage extends StatefulWidget {
  @override
  _AllMapConfigDemoPageState createState() => _AllMapConfigDemoPageState();
}

class _AllMapConfigDemoPageState extends State<AllMapConfigDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('参考项目:https://github.com/bbcef/amap_flutter_map_demo'),
    );
  }
}
