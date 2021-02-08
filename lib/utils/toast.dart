import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Bot{
  static void toast(String title){
    BotToast.showText(text: title);
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

