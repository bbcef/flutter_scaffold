import 'package:flutter/material.dart';
import 'package:flutter_scaffold/viewModel/app_view_model.dart';
import 'package:provider/provider.dart';

import '../../../config.dart';

class DrawerContent extends StatefulWidget {
  @override
  _DrawerContentState createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {

  // 亮暗模式
  ListTile _brightnessWidget(appVm){
    return ListTile(
      title: Text('深色模式'),
      trailing: Switch(
        value: appVm.currentThemeMode == ThemeMode.dark ? true : false,
        onChanged: (value){
          appVm.switchingTheme(value);
          // Scaffold.of(context).openEndDrawer();
        }
      )
    );
  }
  // 性能浮层
  ListTile _performanceOverlayWidget(appVm){
    return ListTile(
      title: Text('性能浮层'),
      trailing: Switch(
        value: appVm.showPerformanceOverlay == true ? true : false,
        onChanged: (value){
          appVm.switchingShowPerformanceOverlay();
        }
      )
    );
  }
  // 主题设置
  ListTile _themeSettingPageWidget(){
    return ListTile(
      title: Text('主题设置'),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: (){
        Navigator.of(context).pushNamed('/theme_setting');
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            color: Theme.of(context).primaryColor,
            width: double.infinity,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/portrait.jpg')
                ),
                Text('Hello World',style: TextStyle(fontSize: 24),)
              ],
            )
          ),
          Consumer<AppViewModel>(
            builder: (context,appVm,child){
              return Column(
                children: [
                  _brightnessWidget(appVm),
                  _performanceOverlayWidget(appVm),
                  _themeSettingPageWidget()
                ]
              );
            }
          ),
        ]
      ),
    );
  }
}
