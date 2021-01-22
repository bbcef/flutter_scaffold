import 'package:flutter/material.dart';
import 'router_page_form.dart';

class RouterPageTo extends StatefulWidget {
  static const String routeName = '/routeTo';
  @override
  _RouterPageToState createState() => _RouterPageToState();
}

class _RouterPageToState extends State<RouterPageTo> {
  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context).settings.arguments as String;
    return WillPopScope(
      onWillPop: (){
        _navPop(context);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('router to'),
          centerTitle: true,
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () => _navPop(context)
          // ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message,style: TextStyle(fontSize: 16)),
              RaisedButton(
                child: Text('返回 form 页面'),
                onPressed: () => _navPop(context)
              ),
            ],
          ),
        )
      ), 
    );
  }

  _navPop(BuildContext context){
    Navigator.of(context).pop('我是从 to 页面传过来的String');
  }
}
