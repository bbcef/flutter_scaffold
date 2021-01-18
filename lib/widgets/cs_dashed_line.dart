import 'package:flutter/material.dart';

class CsDashedLine extends StatelessWidget {
  final Axis axis;
  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;

  CsDashedLine({
    this.axis = Axis.horizontal,
    this.dashedWidth = 1,
    this.dashedHeight = 1,
    this.count = 10,
    this.color = Colors.grey
  });
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        count,
        (_){
          return SizedBox(
            width: dashedWidth,
            height: dashedHeight,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color
              )
            )
          );
        }
      )
    );
  }
}
