import 'package:flutter/material.dart';
import 'package:flutter_scaffold/api/index.dart';
import 'cs_movie_item.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {

  List movies = [];

  @override
  void initState() {
    super.initState();
    MovieList.getMovieList(0,20).then(
      (result){
        setState((){
          movies.addAll(result);
        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    if(movies.length == 0){
      return Center(
        child: Text('加载中...')
      );
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