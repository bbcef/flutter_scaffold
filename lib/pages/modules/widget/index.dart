import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './widgets/base_widget.dart';
import './widgets/sliver_sticky.dart';
import './widgets/custom_scroll.dart';
import './widgets/sliver_list.dart';



class WidgetPage extends StatefulWidget {
  @override
  _WidgetPageState createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  //
  final List<Map> widgetList = [
    {"icon": Icons.settings,'text':'基础部件',"widget": BaseWidget()},
    {"icon": Icons.settings,'text':'滑动组件',"widget": CustomScrollWidget()},
    {"icon": Icons.settings,'text':'滑动组件3',"widget": SliverStickyWidget()},
    {"icon": Icons.settings,'text':'滑动组件4',"widget": SliverListWidget()},
    
  ];
  // 当前显示widget
  Widget _currWidget = BaseWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget'),
        centerTitle: true,
        actions: [
          CustomPopupMenuButton()
        ],
      ),
      body: _currWidget
    );
  }


  
  Widget CustomPopupMenuButton(){
    return PopupMenuButton<String>(
      itemBuilder: (context) => buildItems(),
      offset: Offset(0, 50),
      elevation: 1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
        topRight: Radius.circular(5),
        bottomLeft: Radius.circular(5),
      )),
      onSelected: (e) {
        print(e);
        setState(() {
          widgetList.forEach((item){
            if(item['text'] == e){
              _currWidget = item['widget'];
            }
          });
        });
      },
      onCanceled: () => print('onCanceled'),
    );
  }
  List<PopupMenuItem<String>> buildItems() {
    return widgetList.map((e) => PopupMenuItem<String>(
      value: e['text'],
      child: Wrap(
        spacing: 10,
        children: <Widget>[
          Icon(e['icon'],color: Theme.of(context).primaryColor),
          Text(e['text']),
        ],
      )))
    .toList();
  }
}













