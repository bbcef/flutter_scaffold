import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/utils/storage_utils.dart';
import 'package:flutter_scaffold/pages/home/index.dart';
import 'package:flutter_scaffold/utils/navigator.dart';

class FirstGuildPage extends StatefulWidget {
  @override
  _FirstGuildPageState createState() => _FirstGuildPageState();
}

class _FirstGuildPageState extends State<FirstGuildPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //第一层的图片
          buildBackground(width, height),
          //第二层的点指示
          buildIndfot(),
          //第三层的去首页
          buildGoHome(),
        ],
      ),
    );
  }

  Positioned buildGoHome() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 60,
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //
          AnimatedContainer(
            duration: Duration(milliseconds: 800),
            height: _currentIndex == 2 ? 44 : 0,
            width: _currentIndex == 2 ? 180 : 0,
            child: ElevatedButton(
              child: Text("去首页"),
              onPressed: () {
                StorageUtils.saveBool("isFirst",true);
                NavigatorUtils.pushPageByFade(
                  context: context,
                  targPage: MainPage(),
                  isReplace: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Positioned buildIndfot() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 60,
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buidlIndefot(_currentIndex == 0),
          buidlIndefot(_currentIndex == 1),
          buidlIndefot(_currentIndex == 2),
        ],
      ),
    );
  }

  Widget buidlIndefot(bool isSelect) {
    return AnimatedContainer(
      height: 12,
      width: isSelect ? 40 : 12,
      margin: EdgeInsets.only(left: 16),
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }

  Positioned buildBackground(double width, double height) {
    return Positioned.fill(
      child: PageView(
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        children: [
          Image.asset(
            "assets/images/img1.jpg",
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Image.asset(
            "assets/images/img1.jpg",
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Image.asset(
            "assets/images/img1.jpg",
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
