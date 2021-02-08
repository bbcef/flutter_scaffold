import 'package:flutter/material.dart';

// const Color _bgColor = Theme.of(context).cardColor;// Colors.white; //背景色 白色
const double _imgWH = 22.0; //左侧图片宽高
const double _titleSpace = 100.0; //左侧title默认宽
const double _cellHeight = 50.0; //输入、选择样式一行的高度
const TextStyle _textStyle = TextStyle(fontSize: 14.0, color: Colors.black54);
const double _leftEdge = 15.0; //内部Widget 左边距 15
const double _rightEdge = 10.0; //内部Widget 左边距 10
const double _lineLeftEdge = 15.0; //线 左间距 默认 15
const double _lineRightEdge = 0; //线 右间距 默认  0
const double _lineHeigth = 0.6; //底部线高

typedef _ClickCallBack = void Function();

class CsCell extends StatefulWidget {
  final String title;
  final String leftImgPath; //左侧图片路径 ，默认隐藏 ,设置leftImgPath则 leftWidget失效
  final Widget leftWidget; //左侧widget ，默认隐藏
  final String text;
  final Widget rightWidget; //右侧widget ，默认隐藏
  final bool hiddenArrow; //隐藏箭头，默认不隐藏
  final _ClickCallBack clickCallBack;
  final double titleWidth; //标题宽度
  final TextStyle titleStyle;
  final TextStyle textStyle;
  final bool hiddenLine; //隐藏底部横线
  final double lineLeftEdge; //底部横线左侧距离 默认_leftEdge
  final double lineRightEdge; //底部横线右侧距离 默认0
  final Color bgColor; //背景颜色，默认白色
  final double cellHeight; //底部横线右侧距离 默认_cellHeight
  final double leftImgWH; //左侧图片宽高，默认_imgWH
  final TextAlign textAlign; //默认靠右

  const CsCell({
    Key key,
    @required this.title: '',
    this.leftImgPath,
    this.leftWidget,
    this.text: '',
    this.hiddenArrow: false,
    this.rightWidget,
    this.clickCallBack,
    this.titleWidth = _titleSpace,
    this.titleStyle,
    this.textStyle = _textStyle,
    this.hiddenLine = false,
    this.lineLeftEdge = _lineLeftEdge,
    this.lineRightEdge = _lineRightEdge,
    this.bgColor,
    this.cellHeight = _cellHeight,
    this.leftImgWH = _imgWH,
    this.textAlign = TextAlign.right,
  }) : super(key: key);

  @override
  _CsCellState createState() => _CsCellState();
}

class _CsCellState extends State<CsCell> {
  bool _hiddenArrow = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _hiddenArrow = widget.hiddenArrow;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: widget.bgColor ?? Theme.of(context).cardColor.withOpacity(.6),
        child: InkWell(
          child: Container(
            constraints: BoxConstraints(
                minWidth: double.infinity, //宽度尽可能大
                minHeight: widget.cellHeight //最小高度为50像素
                ),
            padding: EdgeInsets.fromLTRB(_leftEdge, 5, _rightEdge, 5),
            decoration: UnderlineTabIndicator(
                borderSide: BorderSide(
                    width: _lineHeigth,
                    color: widget.hiddenLine == true ? Colors.transparent : Theme.of(context).dividerColor),
                insets: EdgeInsets.fromLTRB(widget.lineLeftEdge, 0, widget.lineRightEdge, 0)),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      widget.leftImgPath != null
                          ? Image.asset(
                              widget.leftImgPath,
                              width: widget.leftImgWH,
                              height: widget.leftImgWH,
                            )
                          : (widget.leftWidget != null ? widget.leftWidget : Container()),
                      SizedBox(width: (widget.leftImgPath != null || widget.leftWidget != null) ? 10 : 0),
                      Offstage(
                        offstage: widget.title.isEmpty ? true : false,
                        child: Container(
                          width: widget.titleWidth,
                          child: Text(widget.title, style: widget.titleStyle),
                        ),
                      ),
                      widget.text == '' || widget.text == null ? Container() : Expanded(child: Text(widget.text)),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        widget.rightWidget != null ? widget.rightWidget : Container(),
                        Offstage(
                          offstage: _hiddenArrow,
                          child: Icon(Icons.keyboard_arrow_right,
                              color: Theme.of(context).textTheme.bodyText2.color.withOpacity(.4)),
                        )
                      ],
                    ),
                  ),
                ]),
          ),
          onTap: () {
            if (widget.clickCallBack != null) {
              widget.clickCallBack();
            }
          },
        ));
  }
}
