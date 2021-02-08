import 'package:flutter/material.dart';
import 'package:flutter_scaffold/utils/navigator.dart';

import 'widgets/about.dart';
import 'widgets/account_info.dart';
import 'widgets/push_setting.dart';

class SettingList{
  
  final String title;
  final String subTitle;
  final Widget navigatorWidget;
  bool isNavigatorPage;

  SettingList(this.title,{
    this.subTitle,
    this.navigatorWidget,
    this.isNavigatorPage = true
  });
}

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {


  // 
  List<SettingList> _baseList = [
    SettingList('账号资料',navigatorWidget: AccountInfoPage()),
    SettingList('安全隐患'),
    SettingList('收货信息'),
  ];

  List<SettingList> _systemList = [
    SettingList('推送设置',navigatorWidget: PushSettingPage()),
    SettingList('消息设置'),
    SettingList('清理存储空间'),
    SettingList('其他设置'),
  ];
  
  List<SettingList> _serviceList = [
    SettingList('我的客服'),
    SettingList('关于',navigatorWidget: AboutPage()),
    SettingList('用户协议'),
    SettingList('隐私政策')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置')
      ),
      body:Scrollbar(
        thickness: 3,
        radius: Radius.circular(8),
        child:SingleChildScrollView(
          child: Column(
            children: [
              _space,
              _listWidget(_baseList),
              _space,
              _listWidget(_systemList),
              _space,
              _listWidget(_serviceList),
              _space,
              _buildLoginOut(),
              _space,
            ],
          ),
        )
      ),
    );
  }

  Widget _space = SizedBox(height: 15);

  Widget _listWidget(List<SettingList> data) {
    return Container(
      color: Theme.of(context).cardColor.withOpacity(.6),
      child: Column(
        children: List.generate(
          data.length,
          (int index){
            final item = data[index];
            return Column(
              children: [
                ListTile(
                  dense: true,
                  title: Text(item.title,style: Theme.of(context).textTheme.bodyText2),
                  subtitle: _buildSubTitle(item.subTitle),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Theme.of(context).textTheme.bodyText2.color.withOpacity(.4)
                  ),
                  onTap: (){
                    if(item.isNavigatorPage == true && item.navigatorWidget != null){
                      NavigatorUtils.pushPage(
                        context: context,
                        targPage: item.navigatorWidget
                      );
                    }
                  },
                ),
                _buildDivider(index,data.length)
              ]
            );
          }
        )
      )
    );
  }

  Widget _buildSubTitle(String subTitle) {
    print(subTitle);
    if(subTitle == null || subTitle == ''){
      return null;
    } else {
      return Text(
        subTitle,
      );
    }
  }
  Widget _buildDivider(int index,int length) {
    if(index != length - 1 ){
      return Divider(
        indent: 15,
        height: 1,
      );
    } else {
      return SizedBox();
    }
  }


  Widget _buildLoginOut() {
    return SizedBox(
      width: double.infinity,
      height: 45,
      // color:Colors.black12,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).cardColor.withOpacity(.6),
        ),
        child: Text('退出登录'),
        onPressed: (){},
      ),
    );
  }
}



