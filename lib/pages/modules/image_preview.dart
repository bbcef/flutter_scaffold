import 'package:flutter/material.dart';
import 'package:flutter_scaffold/utils/navigator.dart';
import 'package:flutter_scaffold/widgets/cs_image_preview.dart';

class ImagePreview extends StatefulWidget {
  static const String routeName = '/image_preview';
  @override
  _ImagePreviewState createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片预览'),
        centerTitle: true,
      ),
      body: Center(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          children: List.generate(
            20, 
            (index){
              final imageUrl = 'https://picsum.photos/500/500?random=$index';
              return GestureDetector(
                child: Hero(
                  tag: imageUrl,
                  child: Image.network(imageUrl,fit: BoxFit.cover),
                ),
                onTap: (){
                  // Navigator.of(context).pushNamed('/cs_image_preview',arguments: imageUrl);

                  NavigatorUtils.pushPageByFade(context: context, targPage: CsImagePreview(imageUrl));
                },
              );
            }
          ),
        ),
      ),
    );
  }
}
