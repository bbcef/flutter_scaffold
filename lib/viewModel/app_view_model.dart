import 'package:flutter/material.dart';
import 'package:flutter_scaffold/config.dart';

class AppViewModel extends ChangeNotifier{

  ThemeData currentTheme = ThemeConfig.lightTheme;

  switchingTheme(){
    currentTheme = currentTheme == ThemeConfig.lightTheme ? ThemeConfig.darkTheme : ThemeConfig.lightTheme;
    notifyListeners();
  }

}