import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_scaffold/widgets/cs_badge.dart';

class ListModel {
  final IconData icon;
  final String text;
  final String route;
  final bool isNew;
  ListModel(this.icon,this.text,this.route,this.isNew);
}


class ProfileContent extends StatefulWidget {
  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {



  List<ListModel> _list = [
    ListModel(Icons.settings,'常用工具函数','/utils',true),
    ListModel(Icons.insert_emoticon,'自定义 icon','/custom_icon',true),
    ListModel(Icons.view_module_outlined,'ViewModel Demo','/viewmodel',false),
    ListModel(Icons.router_outlined,'Routet Demo','/router',false),
    ListModel(Icons.image_outlined,'图片预览 Demo','/image_preview',true),
    ListModel(Icons.add_photo_alternate,'插件 - image_picker','/image_picker',true),
    ListModel(Icons.pending,'插件 - url_launcher','/url_launcher',false),
    ListModel(Icons.share,'插件 - share','/share',false),
    ListModel(Icons.local_grocery_store,'插件 - shared_preferences','/shared_preferences',true),
    ListModel(Icons.refresh,'插件 - flutter_easyrefresh','/flutter_easyrefresh',true),
    ListModel(Icons.refresh,'Widget - banner','/banner',true),
    ListModel(Icons.upgrade,'Widget - r_upgrade','/upgrade',true),
    

    ListModel(Icons.map,'插件 - amap_flutter_map','/amap_flutter_map',false),
    ListModel(Icons.map,'插件 - 百度语音识别','/speak',true),
    
  ];

  // 

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          _buildSliverAppBar(),
          _buildSliverList(),
        ],
      ),
    );
  }

  
  Widget badge(bool isNew){
    if(isNew == true){
      return Positioned(
        right: 0,
        top: 0,
        child: CsBadge(0, isdot: true),
      );
    } else {
      return SizedBox(width: 0);
    }
  }
 
  Widget _buildSliverList() => SliverFixedExtentList(
    itemExtent: 50,
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index){
        final ListModel item = _list[index];
        return ListTile(
          leading: Stack(
            children: [
              Icon(
                item.icon,
                size: 24.0,
                color: Theme.of(context).accentColor
              ),
              badge(item.isNew),
            ],
          ),
          title: Text('${item.text}'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){
            Navigator.of(context).pushNamed(item.route);
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context){
            //       return item['pageWidget'];
            //     }
            //   )
            // );
          },
        );
      },
      childCount: _list.length,
    ),
  );

  Widget  _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 120.0,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: (){
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.settings), 
          onPressed: (){
            
          }
        )
      ],
      title: const Text('我的'),
      elevation: 5,
      pinned: true,
      backgroundColor: Theme.of(context).primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(left: 55, bottom: 15), //标题边距
        collapseMode: CollapseMode.parallax, //视差效果
        background: Image.asset(
          "assets/images/bgimg.jpg",
          fit: BoxFit.cover,
          color: Theme.of(context).primaryColor.withAlpha(88),
          colorBlendMode: BlendMode.srcOver,
        ),
      ),
    );
  }
}