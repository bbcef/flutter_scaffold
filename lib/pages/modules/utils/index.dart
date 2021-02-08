import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/utils/convert_man.dart';
import 'package:flutter_scaffold/utils/date_utils.dart';
import 'package:flutter_scaffold/utils/format_number.dart';
import 'package:flutter_scaffold/utils/toast.dart';

import 'package:flutter_scaffold/models/user.dart';
import 'package:flutter_scaffold/widgets/cs_dialog.dart';
import 'package:flutter_scaffold/widgets/cs_toast.dart';

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




// 




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
    return SingleChildScrollView(
      child: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text("json_model：${currUser.age}"),
            Text("日期时间格式化：${DateUtils.getNowDateStr(format:'yyyy-MM-dd HH:mm:ss')}"),
            Text("今天是：${DateUtils.getNowWeekDay()}"),
            Text("当前毫秒：${DateUtils.getNowDateMs()}"),
            Text("时间简化：${ConvertMan.time2string(DateTime.now())}"),
            Text("数字格式化：${formatNumber(144546469789)}"),
            
            Container(
              width:double.infinity,
              padding: EdgeInsets.only(left:15,right:15),
              child: OutlinedButton.icon(
                icon: Icon(Icons.settings), 
                label: Text('toast'),
                onPressed: (){
                  Bot.toast('Toast');
                },
              ),
            ),

            Container(
              width:double.infinity,
              padding: EdgeInsets.only(left:15,right:15),
              child: OutlinedButton.icon(
                icon: Icon(Icons.settings), 
                label: Text('showSimpleNotification'),
                onPressed: (){
                  BotToast.showSimpleNotification(title: "init",subTitle: "提醒打卡时间已过"); //弹出简单通知Toast
                },
              ),
            ),
            Container(
              width:double.infinity,
              padding: EdgeInsets.only(left:15,right:15),
              child: OutlinedButton.icon(
                icon: Icon(Icons.settings), 
                label: Text('showLoading'),
                onPressed: (){
                  // BotToast.showLoading(duration: Duration(seconds: 3)); //弹出一个加载动画
                  // BotToast.closeAllLoading();


                  BotToast.showCustomLoading(
                    duration: Duration(seconds: 3),
                    toastBuilder: (cancelFunc) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          color: Theme.of(context).cardColor,
                          width: 150,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              CircularProgressIndicator(),
                              Text("加载中...")
                            ],
                          ),
                        ),
                      );
                    }
                  );
                },
              ),
            ),
            Container(
              width:double.infinity,
              padding: EdgeInsets.only(left:15,right:15),
              child: ElevatedButton.icon(
                icon: Icon(Icons.settings), 
                label: Text('toast'),
                onPressed: () => SnackBarToast.toast(context, 'SnackBarToast'),
              ),
            ),


            Container(
              width:double.infinity,
              padding: EdgeInsets.only(left:15,right:15),
              child: ElevatedButton.icon(
                icon: Icon(Icons.settings), 
                label: Text('dialog'),
                onPressed: () {
                  showMyDialog("无context对话框再此", () {
                    BotToast.showText(text: "按钮被点击了");
                  });
                }
              ),
            ),

            ElevatedButton.icon(
              icon: Icon(Icons.settings), 
              label: Text('context'),
              onPressed: () {
                CsDialog.show(
                  context,
                  title: '这是一个有content的弹窗',
                  content: "这是内容"
                );
              }
            ),

            ElevatedButton.icon(
              icon: Icon(Icons.settings), 
              label: Text('CsToast'),
              onPressed: () {
                CsToast.showText(
                  context,
                  msg: 'hello world'
                );
              }
            ),

            ElevatedButton.icon(
                icon: Icon(Icons.settings),
                label: Text('CsToast loading'),
                onPressed: () {
                  CsToast.showHorizontalLoadingText(context,);

                }
            ),
            
            

          ],
        )
      )
    );
  }

  Future showMyDialog(String content, Function onConfirm, {String title}) {
  BotToast.showWidget(toastBuilder: (cancelFunc) {
    return Container(
        color: Colors.black38,
        child: Center(
          child: AlertDialog(
            title: title == null ? null : Text(title),
            content: Text(content),
            actions: <Widget>[
              FlatButton(
                onPressed: cancelFunc,
                child: Text(
                  "取消",
                  style: TextStyle(color: Color(0xff707070)),
                ),
              ),
              FlatButton(
                onPressed: () {
                  onConfirm();
                  cancelFunc();
                },
                child: Text(
                  "确定",
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ));
  });
} 
}
