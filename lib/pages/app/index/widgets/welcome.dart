import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/config.dart';
import 'package:flutter_scaffold/pages/home/index.dart';
import 'package:flutter_scaffold/utils/navigator.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int currentTime = 1;

  Timer _timer;

  @override
  void initState() {
    super.initState();

    //创建计时器 间隔1秒执行
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (currentTime == 0) {
        //停止计时 去首页面
        _timer.cancel();
        goHome();
        return;
      }

      currentTime--;
      setState(() {});
    });
  }

  @override
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }
  void goHome() {
    NavigatorUtils.pushPageByFade(
      context: context,
      targPage: MainPage(),
      isReplace: true,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 5,
            right: 5,
            child: _timeWidget()
          ),
          _contentWidget()
        ]
      )
    );
  }

  // 计时器
  Widget _timeWidget() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      alignment: Alignment.center,
      child: Text(
        "${currentTime}s",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.blue,
        ),
      ),
      width: 100,
      height: 33,
    );
  }

  // 内容
  Widget _contentWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/logo.png',
              width: 85,
              height: 85
            ),
          ),
          SizedBox(height:8),
          Text(AppConfig.title,style: TextStyle(fontSize: 18))
        ],
      )
    );
  }

}