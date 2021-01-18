import 'package:flutter/material.dart';

class CountViewModel extends ChangeNotifier {
  int _count = 99;
  int get count => _count;

  set count(int value){
    _count = value;
    notifyListeners();
  }

}
