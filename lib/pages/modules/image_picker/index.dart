import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/utils/navigator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_scaffold/utils/perlmisson_request.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerPage extends StatefulWidget {
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File _image;
  final picker = ImagePicker();
  
  List<String> _list = [
    "为您更好的体验应用，所以需要获取您的手机相机权限权限",
    "您已拒绝权限",
    "您已拒绝权限，请在设置中心中同意APP的相机权限请求",
    "其他错误"
  ];

  
  
  

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }


  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      initData();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('image_picker 插件 Demo'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
      body: Center(
        child: _image == null
          ? Text('No image selected.')
          : Image.file(_image),
      ),
    );
  }


  void initData() {
    NavigatorUtils.pushPageByFade(
      context: context,
      targPage: PermissionRequestWidget(
        permission: Permission.camera,
        permissionList: _list,
      ),
      dismissCallBack: (value) {
        
      }
    );
  }
}

