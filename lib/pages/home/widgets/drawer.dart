import 'package:flutter/material.dart';
import 'package:flutter_scaffold/viewModel/app_view_model.dart';
import 'package:provider/provider.dart';

import '../../../config.dart';

class DrawerContent extends StatefulWidget {
  @override
  _DrawerContentState createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {
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
            child: Text('Hello World',style: TextStyle(fontSize: 24),)
          ),
          Consumer<AppViewModel>(
            builder: (context,appVm,child){
              return ListTile(
                title: Text('深色模式'),
                trailing: Switch(
                  value: appVm.currentTheme == ThemeConfig.darkTheme ? true : false,
                  onChanged: (value){
                    appVm.switchingTheme();
                    Scaffold.of(context).openEndDrawer();
                  }
                ),
              );
            }
          ),
        ]
      ),
    );
  }
}
