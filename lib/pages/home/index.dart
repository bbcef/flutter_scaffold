import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scaffold/pages/home/modules.dart';
import 'package:flutter_scaffold/pages/home/widgets/drawer.dart';
import 'package:flutter_scaffold/utils/toast.dart';

class MainPage extends StatefulWidget {
  static const String routeName = '/';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currIndex = 0;
  DateTime lastPopTime;


  @override
  void dispose() {
    super.dispose();
    if(lastPopTime != null){
      lastPopTime = null;
    }
  }
  
  // 点击返回键的操作
  signout() async {
    if(lastPopTime == null || DateTime.now().difference(lastPopTime) > Duration(seconds: 2)){
      lastPopTime = DateTime.now();
      Bot.toast('再按一次退出');
    }else{
      lastPopTime = DateTime.now();
      await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child:  Scaffold(
        body: IndexedStack(
          index: _currIndex,
          children: pages
        ),
        drawer: DrawerContent(),
        bottomNavigationBar: BottomNavigationBar(
          elevation:14,
          showSelectedLabels: true,
          unselectedFontSize: 14,
          selectedFontSize: 14,
          currentIndex: _currIndex,
          type: BottomNavigationBarType.fixed,
          items: items,
          onTap: (index){
            setState((){
              _currIndex = index;
            });
          },
        )
      ),
      onWillPop: () => signout()
    );
  }
}


