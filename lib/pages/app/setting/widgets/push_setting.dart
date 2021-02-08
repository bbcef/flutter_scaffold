import 'package:flutter/material.dart';
import 'package:jpush_flutter/jpush_flutter.dart';


class PushSettingPage extends StatefulWidget {
  @override
  _PushSettingPageState createState() => _PushSettingPageState();
}

class _PushSettingPageState extends State<PushSettingPage> {
  final JPush jpush = new JPush();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('推送设置')
      ),
      body: Scrollbar(
        thickness: 3,
        radius: Radius.circular(8),
        child:SingleChildScrollView(
          child: Column(
            children: [
              _space,
              _buildMasterSwitch(),
              
            ]
          )
        )
      )
    );
  }

  Widget _space = SizedBox(height: 15);
  
  Widget _buildMasterSwitch(){
    return Container(
      color: Theme.of(context).cardColor.withOpacity(.6),
      child: Column(
        children: [
          ListTile(
            dense: true,
            title: Text('接受消息通知总开关 - 已开启'),
            subtitle: Text(
              '请在您设备的\'设置-通知\'中，选择\'flutter_scaffold\'进行设置',
              style: TextStyle(fontSize: 10)
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Theme.of(context).textTheme.bodyText2.color.withOpacity(.4)
            ),
            onTap: (){
              jpush.openSettingsForNotification();
            },
          ),
          Divider(
            height: 0,
            indent: 15,
          )
        ]
      ),
    );
  }
}
