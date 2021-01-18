import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final double rating;
  final double maxRating;
  final int count;
  final double size;
  final Color unSelectedColor;
  final Color selectedColor;

  final Widget unSelectedImage;
  final Widget selectedImage;

  StarRating({
    @required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unSelectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffff0000),

    Widget unSelectedImage,
    Widget selectedImage

  }) : unSelectedImage = unSelectedImage ??  Icon(Icons.star_border,color: unSelectedColor,size: size),
    selectedImage = selectedImage ??  Icon(Icons.star,color: selectedColor,size: size);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(mainAxisSize: MainAxisSize.min,children: buidUnSelectedStar()),
        Row(mainAxisSize: MainAxisSize.min,children: buidSelectedStar())
      ],
    );
  }

  // 未选中widget
  List<Widget> buidUnSelectedStar(){
    return List.generate(
      widget.count,
      (index) => Icon(Icons.star_border,color: widget.unSelectedColor,size: widget.size)
    );
  }
  // 选中 widget
  List<Widget> buidSelectedStar(){
    List<Widget> starts = [];
    final star = Icon(Icons.star,color:widget.selectedColor,size:widget.size);

    double oneValue = widget.maxRating / widget.count;

    int entireCount = (widget.rating / oneValue).floor();

    for(var i = 0;i < entireCount; i++ ){
      starts.add(star);
    }

    double leftWidth = ((widget.rating / oneValue) - entireCount) * widget.size;
    final halfStar = ClipRect(
      clipper: starClipper(leftWidth),
      child: star
    );
    starts.add(halfStar);

    if(starts.length > widget.count){
      return starts.sublist(0,widget.count);
    }
    return starts;
  }
}

class starClipper extends CustomClipper<Rect>{

  double width;
  starClipper(this.width);
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0,0,width,size.height);
  }

  @override
  bool shouldReclip(starClipper oldClipper) {
    return oldClipper.width != this.width;
  }
}

