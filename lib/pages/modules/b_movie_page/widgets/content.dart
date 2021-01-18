import 'package:flutter/material.dart';
import 'package:flutter_scaffold/api/index.dart';

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  List movies = [];

  @override
  void initState() {
    super.initState();
    MovieList.getBMovieList().then(
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
        final item = movies[index];
        return Column(
          children: [
            SizedBox(height: 20,),
            ListTile(
              leading: Image.network(item['pic'],fit: BoxFit.cover,width: 100),
              title: Text(
                item['title'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: (){
                
              },
            ),
          ],
        );
      }
    );
  }
}
