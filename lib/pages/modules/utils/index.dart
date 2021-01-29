import 'package:flutter/material.dart';
import 'package:flutter_scaffold/utils/convert_man.dart';
import 'package:flutter_scaffold/utils/date_utils.dart';
import 'package:flutter_scaffold/utils/format_number.dart';
import 'package:flutter_scaffold/utils/toast.dart';

import 'package:flutter_scaffold/models/user.dart';

class UtilsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('工具函数'),
        centerTitle: true,
      ),
      body: BodyWidget(),
    );
  }
}



class BodyWidget extends StatefulWidget {
  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {

  User fatherUser = User.fromJson({"name": "张三爸爸","age": 46,});
  final List<User> friendsUser = [
    User.fromJson({"name": "张三朋友1","age":16,}),
    User.fromJson({"name": "张三朋友3","age": 16,}),
    User.fromJson({"name": "张三朋友4","age": 16,}),
  ];

  User currUser = User.fromJson({
    "name": "张三",
    "age":16,
    // "father": fatherUser,
    // "friends": friendsUser,
    "keywords": ['可爱','善良','和谐']
  });



  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Text("json_model：${currUser.age}"),
          Text("日期时间格式化：${DateUtils.getNowDateStr(format:'yyyy-MM-dd HH:mm:ss')}"),
          Text("今天是：${DateUtils.getNowWeekDay()}"),
          Text("当前毫秒：${DateUtils.getNowDateMs()}"),
          Text("时间简化：${ConvertMan.time2string(DateTime.now())}"),
          Text("数字格式化：${formatNumber(144546469789)}"),
          
          
          OutlinedButton.icon(
            icon: Icon(Icons.shop_two_outlined), 
            label: Text('toast'),
            onPressed: (){
              FlutterToast.cancel();
              FlutterToast.toast('toast');
            },
          ),
          OutlinedButton.icon(
            icon: Icon(Icons.shop_two_outlined), 
            label: Text('toast'),
            onPressed: () => SnackBarToast.toast(context, 'SnackBarToast'),
          ),
        ],
      )
    );
  }
}
