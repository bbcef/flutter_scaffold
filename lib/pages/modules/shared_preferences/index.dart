import 'package:flutter/material.dart';
import 'package:flutter_scaffold/utils/storage_utils.dart';
import 'package:flutter_scaffold/utils/toast.dart';


class SharedPreferencesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('shared_preferences'),
        centerTitle: true,
      ),
      body: PageBody()
    );
  }
}


class PageBody extends StatefulWidget {
  @override
  _PageBodyState createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  String username = '';
  TextEditingController _userNameController;
  FocusNode userFocusNode = FocusNode();

  Widget _buildSuffixIcon(){
    if(username != ''){
      return IconButton(
        splashRadius: 15.0,
        icon: Icon(Icons.close),
        onPressed: () {
          _userNameController.clear();
          userFocusNode.unfocus();
        },
      );
    }
  }
  @override
  void initState() {
    super.initState();
    _userNameController = new TextEditingController();
    _userNameController.addListener((){
      setState((){
        username = _userNameController.value.text.toString();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            focusNode: userFocusNode,
            controller: _userNameController,
            decoration:  InputDecoration(
              contentPadding: const EdgeInsets.only(top: 10.0),
              prefixIcon: Icon(Icons.perm_identity),
              suffixIcon: _buildSuffixIcon(),
              border: OutlineInputBorder(),
              hintText: '请输入用户名'
            ),
          ),
          RaisedButton(
              color: Colors.blueAccent,
              child: Text("存储"),
              onPressed: () {
                if(username == ''){
                  SnackBarToast.toast(context,'数据不能为空');
                  return;
                }
                StorageUtils.saveString('username', username);
                SnackBarToast.toast(context,'数据存储成功');
              }),
          RaisedButton(
              color: Colors.greenAccent,
              child: Text("获取"),
              onPressed: () {
                var username = StorageUtils.getStringWithKey("username");
                SnackBarToast.toast(context,"数据获取成功：$username");
              }),
          RaisedButton(
              color: Colors.greenAccent,
              child: Text("清除"),
              onPressed: () {
                StorageUtils.removeWithKey('username');
                SnackBarToast.toast(context,"重置成功");
              }),
        ],
      )
    );
  }
}

