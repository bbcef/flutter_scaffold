import 'package:flutter/material.dart';
import 'package:flutter_scaffold/config.dart';

class AppViewModel extends ChangeNotifier{

  // 亮暗
  ThemeMode currentThemeMode = AppConfig.themeMode;
  switchingTheme(bool value){
    currentThemeMode = value == true ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  // 主题
  ThemeData copyLightTheme(){
    return ThemeConfig.lightTheme.copyWith(
      primaryColor: currentColor,
      accentColor: currentColor,
    );
  }
  ThemeData copyDarkTheme(){
    return ThemeConfig.darkTheme.copyWith(
      primaryColor: currentColor,
      accentColor: currentColor,
    );
  }
  Color currentColor = AppConfig.primaryColor;
  switchingPrimaryColro(Color color){
    currentColor = color;
    notifyListeners();
  }
  

  // 性能浮层
  bool showPerformanceOverlay = AppConfig.showPerformanceOverlay;
  switchingShowPerformanceOverlay(){
    showPerformanceOverlay = showPerformanceOverlay == true ? false : true;
    notifyListeners();
  }
  

}