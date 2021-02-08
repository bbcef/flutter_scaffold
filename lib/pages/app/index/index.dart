import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scaffold/utils/navigator.dart';
import 'package:flutter_scaffold/utils/perlmisson_request.dart';
import 'package:flutter_scaffold/utils/storage_utils.dart';
import 'package:flutter_scaffold/widgets/cs_protocol.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'widgets/firstGuild.dart';
import 'widgets/welcome.dart';


class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexPageState();
  }
}

class _IndexPageState extends State with CsProtocol {
  List<String> _list = [
    "为您更好的体验应用，所以需要获取您的手机文件存储权限，以保存您的一些偏好设置",
    "您已拒绝权限，所以无法保存您的一些偏好设置，将无法使用APP",
    "您已拒绝权限，请在设置中心中同意APP的权限请求",
    "其他错误"
  ];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      initData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipOval(
          child: Image.asset(
            "assets/images/logo.png",
            width: 66,
            height: 66,
          )
        )
      ),
    );
  }

  void initData() {
    NavigatorUtils.pushPageByFade(
      context: context,
      targPage: PermissionRequestWidget(
        permission: Permission.storage,
        isCloseApp: true,
        permissionList: _list,
      ),
      dismissCallBack: (value) {
        initDataNext();
      }
    );
  }

  //初始化工具类
  void initDataNext() async {
    if (Platform.isIOS) {
      Directory libDire = await getLibraryDirectory();
    }
    //读取一下标识
    bool isAgrement = StorageUtils.getBoolWithKey("isAgrement");

    if (isAgrement == null || !isAgrement) {
      isAgrement = await showProtocolFunction(context);
    }

    if (isAgrement) {
      StorageUtils.saveBool("isAgrement", true);
      next();
    } else {
      closeApp();
    }
  }

  void closeApp() {
    SystemChannels.platform.invokeMethod("SystemNavigator.pop");
  }

  void next() {

    //判断是否第一次安装应用
    bool isFirstInstall = StorageUtils.getBoolWithKey("isFirst");
    
    if(isFirstInstall==null || !isFirstInstall){
      NavigatorUtils.pushPageByFade(
          context: context, targPage: FirstGuildPage(), isReplace: true);
    }else{
      //倒计时页面
      NavigatorUtils.pushPageByFade(
          context: context, targPage: WelcomePage(), isReplace: true);
    }

  }
}









