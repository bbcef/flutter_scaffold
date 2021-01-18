import 'package:flutter/material.dart';
import 'widgets/content.dart';


class BMoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('B站排行榜'),
        centerTitle: true,
      ),
      body: Content()
    );
  }
}

