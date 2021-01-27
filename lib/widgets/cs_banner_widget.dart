import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  final List<String> imageList;

  ///轮播的时间
  final Duration loopDuration;

  BannerWidget({
    //必传参数
    @required this.imageList,
    //轮播时间
    this.loopDuration = const Duration(seconds: 3),
  });

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  //显示的轮播总页数
  int _total = 5;
  //当前显示的页数
  int _current = 0;
  //计时器
  Timer _timer;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    //轮播图个数
    _total = widget.imageList.length;
    //轮播控制器
    _pageController = new PageController(initialPage: 5000);
    //开始轮播
    startLoopFunction();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //轮播 图
    return Container(
      color: Colors.red,
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        //手指按下的回调
        onTapDown: (TapDownDetails details) {
          stopLoopFunction();
        },
        //手指抬起的回调
        onTap: () {
          startLoopFunction();
        },
        //手指按下后滑动移出的回调
        onTapCancel: () {
          startLoopFunction();
        },
        child: buildStack(),
      ),
    );
  }

  //定义开始轮播的方法
  void startLoopFunction() {
    //定时器
    _timer = Timer.periodic(widget.loopDuration, (timer) {
      //滑动到下一页
      _pageController.nextPage(
        curve: Curves.linear,
        duration: Duration(
          milliseconds: 200,
        ),
      );
    });
  }

  //定义停止轮播的方法
  void stopLoopFunction() {
    if (_timer.isActive) {
      _timer.cancel();
    }
  }

  Stack buildStack() {
    return Stack(
      children: [
        //第一层 轮播
        Positioned.fill(
          child: PageView.builder(
            //控制器
            controller: _pageController,
            //总页数
            itemCount: 10000,
            //滑动时回调 value 当前显示的页面
            onPageChanged: (value) {
              setState(() {
                _current = value % widget.imageList.length;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              String image = widget.imageList[index % widget.imageList.length];
              return Image.asset(
                image,
                fit: BoxFit.fill,
              );
            },
          ),
        ),
        //第二层 指示器
        Positioned(
          right: 14,
          bottom: 14,
          child: buildContainer(),
        ),
      ],
    );
  }

  Container buildContainer() {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 24,
      decoration: BoxDecoration(
          color: Colors.grey[200].withOpacity(0.5),
          //设置圆角
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Text(
        "${_current + 1}/$_total",
        textAlign: TextAlign.center,
      ),
    );
  }
}
