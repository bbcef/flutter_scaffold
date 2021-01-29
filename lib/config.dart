import 'package:flutter/material.dart';

class AppConfig{
  // ----------------------------初始化----------------------------
  // 主题
  static final Color primaryColor = Colors.blue;
  // 亮暗模式 - 
  static final ThemeMode themeMode = ThemeMode.system;
  // 是否显示性能浮层
  static final bool showPerformanceOverlay = false;
  // title
  static final String title = 'flutter_scaffold';
}

class HttpConfig{
  static const String baseUrl = 'https://httpbin.org';
  static const int timeout = 5000;
}


class ThemeConfig{
  // ----------------------------亮暗模式----------------------------
  // Button 主题
  static const ButtonThemeData buttonTheme = ButtonThemeData();
  // Card 主题
  static const CardTheme cardTheme = CardTheme(
    elevation: 5
  );
  // Text 主题
  static const TextTheme textTheme = TextTheme(
    bodyText1: TextStyle(fontSize: 16) 
  );
  // 亮色模式
  static final ThemeData lightTheme = ThemeData(
    // 1. 亮度  
    brightness: Brightness.light,
    // 2. 相当于 同时设置了 primaryColor(决定 导航 TabBar 颜色) accentColor（组件等默认颜色）
    // primarySwatch: Colors.green,
    primaryColor: Colors.blue,
    accentColor: Colors.blue,
    buttonTheme: buttonTheme,
    cardTheme: cardTheme,
    textTheme: textTheme
  );
  // 暗黑模式
  static final ThemeData darkTheme = ThemeData(
    // 1. 亮度  暗黑模式
    brightness: Brightness.dark,
    // 2. 相当于 同时设置了 primaryColor(决定 导航 TabBar 颜色) accentColor（组件等默认颜色）
    // primarySwatch: Colors.grey,
    primaryColor: Colors.grey,
    accentColor: Colors.blue,
    buttonTheme: buttonTheme,
    cardTheme: cardTheme,
    textTheme: textTheme
  );
  


}