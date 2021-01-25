import 'package:flutter/material.dart';
import 'package:share/share.dart';

class SharePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分享'),
        centerTitle: true,
      ),
      body: ShareBody(),
    );
  }
}



class ShareBody extends StatefulWidget {
  @override
  _ShareBodyState createState() => _ShareBodyState();
}



class _ShareBodyState extends State<ShareBody> {

  void shareFun (){
    Share.share( '【Flutter】\n https://flutterchina.club/');
  }

  // void shareImg (){
  //   Share.shareFiles(['${directory.path}/image.jpg'], text: 'Great picture');
  // }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            child:Text('点击分享'),
            onPressed: (){
              shareFun();
            },
          )
        ]
      )
    );
  }
}