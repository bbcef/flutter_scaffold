import 'package:flutter/material.dart';


class CsImagePreview extends StatelessWidget {
  static const String routeName = '/cs_image_preview';

  String imageUrl;
  CsImagePreview(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    
    // final imageUrl = ModalRoute.of(context).settings.arguments as String;
    return GestureDetector(
      onTap:(){
        Navigator.of(context).pop();
      },
      child:Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Hero(
            tag: imageUrl,
            child: Image.network(imageUrl,fit: BoxFit.cover),
          ),
        ),
      ) 
    );
  }
}
