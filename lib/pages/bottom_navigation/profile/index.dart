import 'package:flutter/material.dart';
import 'widgets/content.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileContent();
    // Scaffold(
    //   appBar: AppBar(
    //     title: Text('我的'),
    //     centerTitle: true,
    //     leading: IconButton(
    //       icon: Icon(Icons.menu),
    //       onPressed: (){
    //         Scaffold.of(context).openDrawer();
    //       },
    //     )
    //   ),
    //   body: ProfileContent()
    // );
  }
}
