import 'package:flutter/material.dart';
import 'widgets/content.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        centerTitle: true,
      ),
      body: ProfileContent()
    );
  }
}
