import 'package:flutter/material.dart';
import 'package:flutter_scaffold/pages/home/modules.dart';
import 'package:flutter_scaffold/pages/home/widgets/drawer.dart';

class MainPage extends StatefulWidget {
  static const String routeName = '/';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currIndex = 0;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: IndexedStack(
        index: _currIndex,
        children: pages
      ),
      drawer: DrawerContent(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 16,
        selectedFontSize: 16,
        currentIndex: _currIndex,
        type: BottomNavigationBarType.fixed,
        items: items,
        onTap: (index){
          setState((){
            _currIndex = index;
          });
        },
      )
    );
  }
}


