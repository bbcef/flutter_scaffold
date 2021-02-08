import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

const Color _selColor = Colors.white;
const Color _otherColor = Colors.grey;

class CsPhotoBrowser extends StatefulWidget {
  // 图片数据
  List imgData = [];
  // 显示图片索引
  int index;

  String heroTag;
  PageController controller;
  GestureTapCallback onLongPress;
  bool isHiddenTitle;

  CsPhotoBrowser({
    Key key,
    @required this.imgData,
    this.index = 0,
    this.onLongPress,
    this.controller,
    this.heroTag,
    this.isHiddenTitle = false,
  }) : super(key: key) {
    controller = PageController(initialPage: index);
  }

  @override
  _CsPhotoBrowserState createState() => _CsPhotoBrowserState();
}

class _CsPhotoBrowserState extends State<CsPhotoBrowser> {
  // 当前索引
  int currentIndex = 0;
  double statusBarHeight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          bottom: 0,
          right: 0,
          child: Container(
              color: Colors.black,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                onLongPress: () {
                  widget.onLongPress();
                },
                child: PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: (BuildContext context, int index) {
                    var _imgURL = widget.imgData[index];
                    ImageProvider _picture = _imgURL.startsWith('http') ? NetworkImage(_imgURL) : AssetImage(_imgURL);
                    return PhotoViewGalleryPageOptions(
                      imageProvider: _picture,
                      heroAttributes: widget.heroTag != null ? PhotoViewHeroAttributes(tag: widget.heroTag) : null,
                      initialScale: PhotoViewComputedScale.contained,
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered * 2,
                    );
                  },
                  itemCount: widget.imgData.length,
                  // loadingChild: Container(),
                  backgroundDecoration: null,
                  pageController: widget.controller,
                  enableRotation: false,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              )),
        ),
        Positioned(
          top: statusBarHeight + 20,
          left: 0,
          right: 0,
          height: 30,
          child: Offstage(
            offstage: widget.imgData.length == 1 || widget.isHiddenTitle,
            child: Center(
              child: Text("${currentIndex + 1}/${widget.imgData.length}",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: widget.imgData.length == 1 ? 0 : 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.imgData.length,
                  (i) => GestureDetector(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 3.5),
                        child: CircleAvatar(
                          //  foregroundColor: Theme.of(context).primaryColor,
                          radius: 3.5,
                          backgroundColor: currentIndex == i ? _selColor : _otherColor,
                        )),
                  ),
                ).toList(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
