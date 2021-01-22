import 'package:flutter/material.dart';
import 'widgets/map_all_config.dart';


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


