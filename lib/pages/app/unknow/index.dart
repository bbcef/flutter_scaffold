import 'package:flutter/material.dart';

class UnknowPage extends StatelessWidget {
  static const String routeName = '/unknow';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pop('页面错误');
        return Future.value(true);
      },
      child: Scaffold(
        appBar:AppBar(
          title: Text('错误页面'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('错误页面，请检查路由',style: TextStyle(fontSize: 24.0,color: Colors.red),)
        ),
      )
    );
  }
}
