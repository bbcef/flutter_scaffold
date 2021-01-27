import 'package:flutter/material.dart';
import 'package:flutter_scaffold/widgets/cs_banner_widget.dart';

class BannerPage extends StatelessWidget {

  List<String> _list = [
    "assets/images/bgimg.jpg",
    "assets/images/bgimg.jpg",
    "assets/images/bgimg.jpg",
    "assets/images/bgimg.jpg",
    "assets/images/bgimg.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('banner demo'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: BannerWidget(
              imageList: _list,
            ),
          )
        ),
      )
    );
  }
}