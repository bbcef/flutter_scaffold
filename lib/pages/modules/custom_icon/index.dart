import 'package:flutter/material.dart';
import 'package:flutter_scaffold/utils/nhtc_icon.dart';

class CoustomIconPage extends StatelessWidget {
  static const String  routeNmae = "/custom_icon";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义icon'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: CenterBody(),
    );
  }
}

class CenterBody extends StatelessWidget {
  List _listIcons = [
    {'text': 'NhtcIcons.shoucishenchashenpi', 'iconData': NhtcIcons.shoucishenchashenpi},
    {'text': 'NhtcIcons.yongxinshenchashenpi', 'iconData': NhtcIcons.yongxinshenchashenpi},
    {'text': 'NhtcIcons.shouxinshenchashenpi', 'iconData': NhtcIcons.shouxinshenchashenpi},
  ];
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.8
      ),
      children: _listIcons.map((e){
          return Container(
            color: Colors.grey,
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Icon(
                  e['iconData'],
                  size: 24,
                  color: Colors.white
                ),
                Text(e['text'],maxLines: 3,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 14),)
              ]
            ),
          );
        }
      ).toList()
    );
  }
}
