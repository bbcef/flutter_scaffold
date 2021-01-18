import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:flutter_scaffold/model/user_info.dart';

import 'package:flutter_scaffold/viewModel/count_view_model.dart';
import 'package:flutter_scaffold/viewModel/user_view_model.dart';
import 'package:flutter_scaffold/viewModel/app_view_model.dart';

final userInfo = UserInfo('zhangsan',1,'https://www.baidu.com');
List<SingleChildWidget> providers = [
  ChangeNotifierProvider( create: (ctx) => CountViewModel() ),
  ChangeNotifierProvider( create: (ctx) => UserViewModel(userInfo)),
  ChangeNotifierProvider( create: (ctx) => AppViewModel()),
];
