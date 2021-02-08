import 'package:flutter/material.dart';
import 'package:flutter_scaffold/utils/navigator.dart';
import 'package:flutter_scaffold/widgets/cs_photo_browser.dart';

class ImagePreview extends StatefulWidget {
  static const String routeName = '/image_preview';
  @override
  _ImagePreviewState createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {

  List<Map<String,dynamic>> urls = List.generate(20, (index){
    return {
      "url": "https://picsum.photos/500/500?random=$index",
      "index": index
    };
  }).toList();
  List<String> urlImages = [];


  @override
  void initState() {
    super.initState();
    setState((){
      for(var i = 0;i<urls.length;i++){
        urlImages.add(urls[i]['url']);
      }
    });
  }
  
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
          children: urls.map((imageObj){
            final currUrl = imageObj['url'];
            final index = imageObj['index'];
            return GestureDetector(
              child: Image.network(currUrl,fit: BoxFit.cover),
              // Hero(
              //   tag: '1',//currUrl
              //   child: ,
              // ),
              onTap: (){
                NavigatorUtils.pushPageByFade(
                  context: context,
                  targPage: CsPhotoBrowser(imgData:urlImages,index: index)
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
