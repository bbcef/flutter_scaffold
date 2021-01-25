import 'package:flutter/material.dart';
import 'package:flutter_scaffold/api/index.dart';

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  bool loading = false;
  List movies = [];


  void getLIstData(){
    setState((){
      loading = true;
    });
    MovieList.getBMovieList().then(
      (result){
        setState((){
          loading = false;
          movies.addAll(result);
        });
      }
    ).catchError((err){
      setState((){
        loading = false;
      });
    });
  }
  @override
  void initState() {
    super.initState();
    getLIstData();
  }
  Widget _loadingWidget(){
    return Center(
      child: Text('加载中...')
    );
  }
  Widget _warningWidget(){
    return Center(
      child: GestureDetector(
        onTap: () => getLIstData(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color:Colors.transparent,
          alignment: Alignment.center,
          child: Text('数据加载失败，轻触重试...'),
        ),
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    if(movies.length == 0 && loading == true){
      return _loadingWidget();
    } else if(movies.length == 0 && loading == false){
      return _warningWidget();
    }
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (BuildContext context,int index){
        final item = movies[index];
        return BListItem(item,index);
      }
    );
  }
}




class BListItem extends StatefulWidget {

  Map _info;
  int index;

  BListItem(this._info,this.index);
  @override
  _BListItemState createState() => _BListItemState();
}

class _BListItemState extends State<BListItem> {

  // 图片
  Widget _buildImg(String image){
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: Image.network(image,fit: BoxFit.cover,width: 150)
    );
  }
  // 文字信息
  Widget _buildText(Map info,int index){
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left:15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextTitle(info['title'],index),
            SizedBox(height:15.0),
            _buildPlayInfo(info),
            _buildOther(info['score'])
          ]
        )
      ),
    );
  }
  // 标题
  Widget _buildTextTitle(String title,int index){
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(3.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Theme.of(context).accentColor,
          ),
          child: Text('No.${index + 1}',style:TextStyle(color:Colors.white)),
        ),
        SizedBox(width:5),
        Expanded(
          child: Text(title,maxLines: 1,overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600)),
        )
      ],
    );
  }
  // 播放数据
  Widget _buildPlayInfo(Map info){
    const double iconSize =  12.0;
    const TextStyle textStyle = TextStyle(fontSize: 14.0);
    return Row(
      children: [
        Icon(Icons.play_circle_fill_outlined,size: 12,),
        Text('${info['stat']['view']}',style: textStyle,),
        SizedBox(width:5),
        Icon(Icons.text_fields,size: iconSize,),
        Text('${info['stat']['danmaku']}',style: textStyle,),
        SizedBox(width:5),
        Icon(Icons.person,size: iconSize,),
        Expanded(
          child: Text('${info['owner']['name']}',maxLines: 1,overflow: TextOverflow.ellipsis,style: textStyle,)
        )
      ]
    );
  }
  // 评分
  Widget _buildOther(int score){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('综合评分：$score',style: TextStyle(fontSize: 14.0),),
        IconButton(
          splashRadius: 15,
          icon: Icon(Icons.more_vert),
          onPressed: (){

          }
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
          bottom:BorderSide(
            color: Colors.grey,
            width: 1
          )
        )
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImg(widget._info['pic']),
              _buildText(widget._info,widget.index),
            ],
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                // splashColor: Colors.white.withOpacity(0.3),
                // highlightColor: Colors.white.withOpacity(0.3),
                onTap: (){},
              ),
            )
          )
        ],
      )
    );
  }
}
