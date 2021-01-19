import 'package:flutter/material.dart';

class ProfileContent extends StatefulWidget {
  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  List _list(){
    final double iconSize = 24.0;
    final Color iconColor = Theme.of(context).accentColor;
    return [
      {'icon':Icon(Icons.insert_emoticon,size: iconSize,color: iconColor),'text': '自定义 icon', 'route': '/custom_icon'},
      {'icon':Icon(Icons.view_module_outlined,size: iconSize,color: iconColor),'text': 'ViewModel Demo', 'route': '/viewmodel'},
      {'icon':Icon(Icons.router_outlined,size: iconSize,color: iconColor),'text': 'Routet Demo', 'route': '/router'},
      {'icon':Icon(Icons.image_outlined,size: iconSize,color: iconColor),'text': '图片预览 Demo', 'route': '/image_preview'},
      {'icon':Icon(Icons.list,size: iconSize,color: iconColor),'text': 'B站热门排行榜', 'route': '/b_movie_list'},
      {'icon':Icon(Icons.add_photo_alternate,size: iconSize,color: iconColor),'text': '插件 - image_picker', 'route': '/image_picker'},
      {'icon':Icon(Icons.pending,size: iconSize,color: iconColor),'text': '插件 - url_launcher', 'route': '/url_launcher'},



      // {'icon':Icon(Icons.image_outlined,size: iconSize,color: iconColor),'text': '插件 - webview_flutter', 'route': '/url_launcher'},
      // {'icon':Icon(Icons.image_outlined,size: iconSize,color: iconColor),'text': '插件 - share', 'route': '/url_launcher'},
      
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _list().length,
      itemBuilder: (BuildContext context,int index){
        final Map item = _list()[index];
        return ListTile(
          leading: item['icon'],
          title: Text('${item['text']}'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){
            Navigator.of(context).pushNamed(item['route']);
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context){
            //       return item['pageWidget'];
            //     }
            //   )
            // );
          },
        );
      }
    );
  }
}