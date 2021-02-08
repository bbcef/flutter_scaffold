import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseWidget extends StatefulWidget {
  @override
  _BaseWidgetState createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.withOpacity(.5),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  print('11');
                },
                child: Container(
                  height: 155,
                  alignment: Alignment.center,
                  child: Text('container'),
                )
              )
            ),
            Ink(
              child: InkWell(
                onTap: (){
                  print('11');
                },
                child: Image.asset(
                  'assets/images/bgimg.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Stack(
              children: [
                Image.asset(
                  'assets/images/bgimg.jpg',
                  height: 155,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      print('11');
                    },
                    child: Container(
                      height: 155,
                    )
                  )
                ),
              ],
            ),
            Container(
              child: Scrollbar(
                thickness: 3,
                radius: Radius.circular(8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(
                      8,
                      (int index){
                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Icon(Icons.settings),
                              SizedBox(height: 14,),
                              Text('设置')
                            ]
                          ),
                        );
                      }
                    ).toList()
                  ),
                )
              )
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    8,
                    (int index){
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            // ClipOval
                            
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/portrait.jpg',
                                width: 85,
                                height: 85,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 14,),
                            OutlinedButton(
                              child: Text('下载'),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(1),
                                backgroundColor: Colors.grey.withOpacity(.5),
                                side: BorderSide(color: Colors.transparent),
                                
                              ),
                              onPressed: (){},
                            )
                          ]
                        ),
                      );
                    }
                  ).toList()
                ),
              )
            ),

            Container(
              padding:EdgeInsets.all(5),
              child: OutlinedButton.icon(
                icon: Icon(Icons.add),
                label: Text('按钮'),
                onPressed: (){},
              ),
            ),
            Container(
              width: double.infinity,
              padding:EdgeInsets.all(5),
              child: RaisedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    Text('按钮')
                  ],
                ),
                onPressed: (){},
              ),
            ),
            Container(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                color: Colors.green.withOpacity(.5),
                shadowColor: Colors.blue,
                elevation: 5,
                child: Column(
                  children:[
                    // AspectRatio(
                    //   aspectRatio: 1.9,
                    //   child: Image.asset('assets/images/bgimg.jpg',width: double.infinity,fit:BoxFit.cover),
                    // ),
                    ListTile(
                      leading: Image.asset('assets/images/portrait.jpg',width: 85,fit:BoxFit.cover),
                      title: Text('Title'),
                      subtitle: Text('subTitle'),
                      trailing: IconButton(
                        icon: Icon(Icons.keyboard_arrow_right),
                        onPressed: (){},
                      ),
                      onTap: (){},
                    )
                  ]
                ),
              ),
            ),


            Switch(
              activeColor: Colors.blue,
              activeThumbImage: AssetImage('assets/images/portrait.jpg'),
              value: switchValue,
              onChanged: (bool value){
                setState(() {
                  switchValue = value;             
                });
              },
            ),

            CupertinoSwitch(
              value: switchValue,
              onChanged: (bool value){
                setState(() {
                  switchValue = value;             
                });
              },
            ),

            Checkbox(
              activeColor: Colors.blue,
              value: switchValue,
              onChanged: (bool value){
                setState(() {
                  switchValue = value;             
                });
              },
            ),

            Radio(
              value: switchValue,
              groupValue:switchValue ,
              onChanged: (bool value){
                setState(() {
                  switchValue = value;             
                });
              },
            ),

            Chip(
              elevation: 1,
              shadowColor: Colors.green,
              backgroundColor: Colors.blue,
              avatar: Icon(Icons.settings,size: 16,),
              label: Text('chip'),
              labelPadding: EdgeInsets.all(1),
              deleteIcon: Icon(Icons.close,size: 14,),
              onDeleted: (){},
            ),

            tabbarWidget(),

            AlertDialogWidget(),
          ]
        ),
      )
    );
  }
}



// TabBar Widget
class tabbarWidget extends StatefulWidget {
  @override
  _tabbarWidgetState createState() => _tabbarWidgetState();
}

class _tabbarWidgetState extends State<tabbarWidget> with SingleTickerProviderStateMixin {
  TabController _tabcontroller;
  final List<String> tabs = ['demo1','demo3','demo4','demo5','demo6','demo7','demo8','demo9'];

    @override
    void initState() {
      super.initState();
      _tabcontroller = TabController(vsync: this,length: tabs.length);
    }

    @override
    void dispose() {
      _tabcontroller.dispose();
      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent
      ),
      child: TabBar(
        controller: _tabcontroller,
        onTap: (tab){
          print(tab);
        },
        unselectedLabelColor: Colors.grey,//设置未选中时的字体颜色，tabs里面的字体样式优先级最高
        unselectedLabelStyle: TextStyle(fontSize:14),//设置未选中时的字体样式，tabs里面的字体样式优先级最高
        labelColor: Colors.blue,//设置选中时的字体颜色，tabs里面的字体样式优先级最高
        labelStyle: TextStyle(fontSize: 18.0),//设置选中时的字体样式，tabs里面的字体样式优先级最高
        isScrollable: true,//允许左右滚动
        indicatorColor: Colors.blue,//选中下划线的颜色
        indicatorSize: TabBarIndicatorSize.label,//选中下划线的长度，label时跟文字内容长度一样，tab时跟一个Tab的长度一样
        indicatorWeight: 1.0,//选中下划线的高度，值越大高度越高，默认为2。0
        tabs: tabs.map((e) => Tab(text:e)).toList(),

      )
    );
  }
}

// alertDialog
// 
  enum Action {
    Ok,
    Cancel
  }
class AlertDialogWidget extends StatefulWidget {
  @override
  _AlertDialogWidgetState createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  String _choice = 'Nothing';
  Future _openAlertDialog() async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,//// user must tap button!
      builder: (BuildContext context) {
        return _alertDialog(context);
      },
    );
    
    
    print(action);
    // switch (action) {
    //   case Action.Ok:
    //     setState(() {
    //       _choice = 'Ok';
    //     });
    //     break;
    //   case Action.Cancel:
    //     setState(() {
    //       _choice = 'Cancel';
    //     });
    //     break;
    //   default:
    // }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          child: Text('AlertDialog'),
          onPressed: _openAlertDialog
        )
      ],
    );
  }


  Widget _alertDialog(BuildContext context){
    return AlertDialog(
      content: Text('您确定要删除吗？'),
      actions: <Widget>[
        FlatButton(
          child: Text('取消'),
          onPressed: () {
            Navigator.pop(context, Action.Cancel);
          },
        ),
        FlatButton(
          child: Text('确认',style:TextStyle(color: Colors.blue)),
          onPressed: () {
            Navigator.pop(context, Action.Ok);
          },
        ),
      ],
    );
  }
}




