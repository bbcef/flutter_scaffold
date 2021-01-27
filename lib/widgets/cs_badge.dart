import 'package:flutter/material.dart';

Widget CsBadge(int count,
      {Color color = Colors.red,
      bool isdot = false,
      double height = 18.0,
      double width = 18.0}) {
    final _num = count > 99 ? '···' : count;
    return Container(
        alignment: Alignment.center,
        height: !isdot ? height : height / 2,
        width: !isdot ? width : width / 2,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(100.0)),
        child: !isdot
            ? Text('$_num',
                style: TextStyle(color: Colors.white, fontSize: 12.0))
            : null);
  }
