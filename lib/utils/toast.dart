import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToast {
  static void toast(String msg){
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,  // 消息框弹出的位置
      // backgroundColor: Colors.grey,
      // textColor: Colors.white,
      fontSize: 16.0
    );
  }
  static void cancel(){
    Fluttertoast.cancel();
  }
}


class SnackBarToast {
  static toast(BuildContext context, String msg,
      {duration = const Duration(milliseconds: 600),
        Color color,
        SnackBarAction action}) {
    Scaffold.of(context).removeCurrentSnackBar();
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: duration,
      action: action,
      backgroundColor: color??Theme.of(context).primaryColor,
    ));
  }
}

