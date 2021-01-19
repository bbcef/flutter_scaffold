import 'package:flutter/material.dart';
import 'package:flutter_scaffold/viewModel/app_view_model.dart';
import 'package:provider/provider.dart';


class ThemeSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主题设置'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: PageContent()
    );
  }
}


class PageContent extends StatefulWidget {
  @override
  _PageContentState createState() => _PageContentState();
}

class _PageContentState extends State<PageContent> {


  final List colors = [
    {'title': '天蓝', 'color': Colors.blue},
    {'title': '红色', 'color': Colors.red},
    {'title': '黄色', 'color': Colors.yellow},
  ];
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(15.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15.0,
        childAspectRatio: 1.0,
      ),
      children: Colors.primaries.map((color){
        return Consumer<AppViewModel>(
          builder: (context,appVM,child){
            return InkWell(
              radius:50.0,
              onTap: (){
                appVM.switchingPrimaryColro(color);
              },
              child: CircleAvatar(
                radius:5.0,
                backgroundColor: color,
                child: color == appVM.currentColor ? Icon(Icons.check,size: 35) : null
              )
            );
          }
        );
        
        // Container(
        //   width: double.infinity,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //     color: color
        //   ),
        // );
      }).toList(),
    );
    // Padding(
    //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //   child: Wrap(
    //     spacing: 5,
    //     runSpacing: 5,
    //     children: <Widget>[
    //       ...Colors.primaries.map((color) {
    //         return Material(
    //           color: color,
    //           child: Consumer<AppViewModel>(
    //             builder: (context,appVM,child){
    //               return InkWell(
    //                 onTap: (){
    //                   appVM.switchingPrimaryColro(color);
    //                 },
    //                 child: Container(
    //                   height: 40,
    //                   width: 40,
    //                 ),
    //               );
    //             }
    //           )
    //         );
    //       }).toList(),
    //     ],
    //   ),
    // );
  }
}

