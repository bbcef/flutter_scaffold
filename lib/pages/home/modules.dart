import 'package:flutter/material.dart';
import 'package:flutter_scaffold/pages/bottom_navigation/home/index.dart';
import 'package:flutter_scaffold/pages/bottom_navigation/profile/index.dart';

class HomeBottomBarItem extends BottomNavigationBarItem {
  HomeBottomBarItem(IconData icon,IconData activeIcon,String title)
  : super(
    label:title,
    icon: Icon(icon),
    activeIcon: Icon(activeIcon)
  );
}


List<HomeBottomBarItem> items = [
  HomeBottomBarItem(Icons.home, Icons.home, '首页'),
  HomeBottomBarItem(Icons.person, Icons.person, '我的'),
];

List<Widget> pages = [
  HomePage(),
  ProfilePage()
];