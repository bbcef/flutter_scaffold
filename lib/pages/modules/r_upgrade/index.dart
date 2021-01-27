import 'package:flutter/material.dart';
import 'package:r_upgrade/r_upgrade.dart';
import 'dart:io';


class UpgradePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app 更新'),
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


  void upgradeFromUrl()async{
    bool isSuccess =await RUpgrade.upgradeFromUrl(
      'https://www.baidu.com',
    );
    print('$isSuccess');
  }
  // android 
  void upgradeFromAndroidStore()async{
      bool isSuccess = await RUpgrade.upgradeFromAndroidStore(AndroidStore.BAIDU);
      print('${isSuccess?'跳转成功':'跳转失败'}');
  }
  // ios
  void upgradeFromAppStore() async {
    bool isSuccess =await RUpgrade.upgradeFromAppStore(
      '您的AppId',//例如:微信的AppId:414478124
    );
    print(isSuccess);
  }
  Widget buildFromStore(){
    if(Platform.isIOS){
      return OutlinedButton.icon(
        icon: Icon(Icons.link), 
        label: Text('跳转到应用商店升级'),
        onPressed: () => upgradeFromAppStore(),
      );
    }else if(Platform.isAndroid){
      return OutlinedButton.icon(
        icon: Icon(Icons.link), 
        label: Text('跳转到应用商店升级'),
        onPressed: () => upgradeFromAndroidStore(),
      );
    } else {
      return Container();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          OutlinedButton.icon(
            icon: Icon(Icons.link), 
            label: Text('使用打开链接的方式进行更新'),
            onPressed: () => upgradeFromUrl(),
          ),
          buildFromStore(),
          Text('更多参考：https://juejin.cn/post/6844904186925023246')
          
        ],
      )
    );
  }
}

