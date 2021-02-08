import 'package:flutter/material.dart';
List<Widget> colorWidget(){
  final colors = <Color>[
    Colors.blue[50],
    Colors.blue[100],
    Colors.blue[200],
    Colors.blue[300],
    Colors.blue[400],
    Colors.blue[500],
    Colors.blue[600],
    Colors.blue[700],
    Colors.blue[800],
    Colors.blue[900],
  ];
  return colors.map((Color color){
    return Container(
      height: 85,
      alignment:Alignment.center,
      color:color,
      child:Text('text')
    );
  }).toList();
}



class CustomScrollWidget extends StatefulWidget {
  @override
  _CustomScrollWidgetState createState() => _CustomScrollWidgetState();
}

class _CustomScrollWidgetState extends State<CustomScrollWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: false,
      reverse: false,
      slivers: [
        _buildSliverAppBar(context),
        _buildSliverList(context),
        _buildSliverGrid(context)
      ], 
    );
  }
}


// 
Widget _buildSliverAppBar(BuildContext context){
  return SliverAppBar(
    expandedHeight: 155,
    pinned: true,
    floating: false,
    elevation: 14,
    flexibleSpace: FlexibleSpaceBar(
      background: Image.asset(
        "assets/images/bgimg.jpg",
        fit: BoxFit.cover,
        color: Theme.of(context).primaryColor.withAlpha(88),
        colorBlendMode: BlendMode.srcOver,
      ),
    ),
    leading: IconButton(
      icon: Icon(Icons.keyboard_arrow_left),
      onPressed: (){
        Navigator.of(context).pop();
      }
    ),
    title: Text('demo'),
    actions: [
      IconButton(
        icon: Icon(Icons.share),
        onPressed: (){}
      ),
      IconButton(
        icon: Icon(Icons.more),
        onPressed: (){}
      ),
    ],
  );
}
// 
Widget _buildSliverList(BuildContext context){
  return SliverList(
    delegate: SliverChildListDelegate(
      List.generate(5, (int index){
        return Column(
          children: [
            ListTile(
              dense: true,
              leading: Icon(Icons.settings),
              title: Text('title ${index + 1}',),
              subtitle: Text('subTitle ${index + 1}'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){},
            ),
            Divider(height: 0,color: Colors.blue,indent: 15,)
          ],
        );
      }),
    )
  );
}

Widget _buildSliverGrid(BuildContext context){
  return SliverGrid(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      childAspectRatio: 16 / 9,//子控件宽高比 
    ),
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Container(
          alignment: Alignment.center,
          color: Colors.red,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.settings),
              SizedBox(height: 14,),
              Text('setting',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          )
        );
      },
      childCount: 4,
    ),
  );
}