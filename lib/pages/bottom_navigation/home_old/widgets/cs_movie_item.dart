import 'package:flutter/material.dart';
import 'package:flutter_scaffold/widgets/cs_star_rating.dart';
import 'package:flutter_scaffold/widgets/cs_dashed_line.dart';



class MovieItem extends StatefulWidget {

  // 排行
  final int rank;
  // 名称
  final String title;
  // 图片
  final String cover_url;
  // 类型
  final List<dynamic> types;
  // 区域
  final List<dynamic> regions;
  // 发布日期
  final String release_date;
  // 演员
  final List<dynamic> actors;
  // 分数
  final String score;
  // 评分人数
  final int vote_count;
  // 是否可播放
  final bool is_playable;

  MovieItem({
    this.rank,
    this.title,
    this.score,
    this.cover_url,
    this.types,
    this.regions,
    this.release_date,
    this.actors,
    this.vote_count,
    this.is_playable
  });
  @override
  _MovieItemState createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
          bottom:BorderSide(
            color: Colors.grey,
            width: 5
          )
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildImg(),
          buildContent()
        ],
      )
    );
  }
  
  // 左侧图片
  Widget buildImg(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(widget.cover_url,fit: BoxFit.cover,width: 100)
    );
  }
  // 中间内容
  final TextStyle textStyle = TextStyle(
    fontSize: 14.0,
  );
  Widget buildContent(){
    final String date = widget.release_date.substring(0,4);
    final String region = widget.regions[0];
    final typess = widget.types.join('、'); 
    final actorss = widget.actors.join('、');
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left:15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 标题
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(3.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Theme.of(context).accentColor,
                  ),
                  child: Text('No.${widget.rank}',style:TextStyle(color:Colors.white)),
                ),
                SizedBox(width:5),
                Text(widget.title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600)),
                SizedBox(width:3),
                widget.is_playable ? Icon(Icons.play_arrow_rounded) : Text(' ')
              ],
            ),
            SizedBox(height:10),
            // 时间 / 地区 / 类型
            Text(
              '$date / $region / $typess',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textStyle,
            ),
            SizedBox(height:10),
            // 演员
            Text(
              actorss, 
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: textStyle,
            ),
            SizedBox(height:10),
            CsDashedLine(dashedWidth:8),
            SizedBox(height:10),
            // 评分
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      StarRating(rating: double.parse(widget.score),selectedColor: Theme.of(context).accentColor,size: 18),
                      SizedBox(width: 5),
                      Text(widget.score,style:TextStyle(color: Theme.of(context).accentColor,fontSize: 14)),
                    ],
                  )
                ),
                Text('${widget.vote_count} 人评分',style: textStyle,)
              ],
            ),
          ],
        )
      )
    );
     
  }

}
