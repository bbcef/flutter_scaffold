import 'package:flutter/material.dart';
import 'router_page_to.dart';


class RouterPageForm extends StatefulWidget {
  static const String routeName = '/router';
  @override
  _RouterPageFormState createState() => _RouterPageFormState();
}

class _RouterPageFormState extends State<RouterPageForm> {
  String _text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('router form'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_text,style: TextStyle(fontSize: 16)),
            RaisedButton(
              child: Text('页面跳转到 To 页面'),
              onPressed: (){
                Future result = Navigator.of(context).pushNamed('/routeTo',arguments: '我是从 form 页面传过来的String');
                // Future result = Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => RouterPageTo(text:'我是从 form 页面传过来的String')
                //   )
                // );
                result.then((res) => {
                  if(result != null){
                    setState(() {
                      _text = res;
                    })
                  }
                });
              }
            ),
          ],
        )
      ),
    );
  }
}