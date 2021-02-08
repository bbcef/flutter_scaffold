import 'package:flutter/material.dart';
import 'package:flutter_scaffold/widgets/cs_cell.dart';
import 'package:flutter_scaffold/widgets/cs_circle_image.dart';


class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: 
      // SingleChildScrollView(
      //   child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:28.0),
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                children: [
                  CsCircleImage(image: AssetImage('assets/images/portrait.jpg')),
                  Text('Flutter_scaffold',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text('Version 1.0.0'),
                ]
              )
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 4,
                children: <Widget>[
                  Text('Power By cef',style: TextStyle(fontSize: 12,color: Colors.grey),),
                  Text('Copyright © 2008-2020 cef',style: TextStyle(fontSize: 12,color: Colors.grey),),
                ],
              )
            )
          ],
        )
      // )
    );
  }
}

