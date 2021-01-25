import 'package:flutter/material.dart';
import 'package:flutter_scaffold/api/index.dart';
import 'cs_movie_item.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool _loading = false;
  List movies = [];

  void getLIstData (){
    setState((){
      _loading = false;
    });
    MovieList.getMovieList(0,250).then(
      (result){
        setState((){
          _loading = true;
          movies.addAll(result);
        });
      }
    ).catchError((err) {
      setState((){
        _loading = true;
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
    if(movies.length == 0 && _loading == false){
      return _loadingWidget();
    } else if(movies.length == 0 && _loading == true){
      return _warningWidget();
    }
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (BuildContext context,int index){
        final currItem = movies[index];
        final int rank = currItem['rank'];
        final String title = currItem['title'];
        final String score = currItem['score'];
        final cover_url = currItem['cover_url']; 
        final List<dynamic> types = currItem['types'];
        final List<dynamic> regions = currItem['regions'];
        final release_date = currItem['release_date'];
        final List<dynamic> actors = currItem['actors'];
        final int vote_count = currItem['vote_count'];
        final bool is_playable = currItem['is_playable'];
        return MovieItem(
          rank: rank,
          title: title,
          score:score,
          types: types,
          cover_url: cover_url,
          regions: regions,
          release_date: release_date,
          actors: actors,
          vote_count: vote_count,
          is_playable: is_playable
        );
      }
    );
  }
}