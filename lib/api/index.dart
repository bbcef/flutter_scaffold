import 'package:flutter_scaffold/utils/http.dart';
import 'package:flutter_scaffold/model/index.dart';


class MovieList{
  // 豆瓣 top
  static Future<List> getMovieList(int start,int limit) async {
    final String url = 'https://movie.douban.com/j/chart/top_list?type=11&interval_id=100%3A90&action=&start=$start&limit=$limit';
    final result = await Http.request(url);
    // <DoubanMovieTop>
    List movies = [];
    for(var sub in result){
      movies.add(sub);
    }
    return movies; 
  }

  // B站排行榜
  static Future<List> getBMovieList() async {
    final String url = 'https://api.bilibili.com/x/web-interface/ranking/v2?rid=0&type=all';
    final result = await Http.request(url);
    List list = result['data']['list'];
    // <DoubanMovieTop>
    // List movies = [];
    // for(var sub in result){
    //   movies.add(sub);
    // }
    return list; 
  }
}




