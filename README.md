# flutter_scaffold
### 一个基于flutter 的基础脚手架项目。(不定时更新)
#### 关于flutter
1. 安装 [flutter 安装](https://flutterchina.club/get-started/install/)
2. json_to_dart [json_to_dart](https://javiercbk.github.io/json_to_dart/)
3. flutter widget [flutter 老孟](http://laomengit.com/flutter/widgets/widgets_structure.html)

#### 关于本项目
+ 目录结构 (树结构 这不会写)
>  lib
>> api  api接口等
>>> 1
>> model  数据模型
>>> 1
>> pages  业务页面
>>>
>> router 路由
>> utils  工具函数(待完善)
>> viewModel  MVVM 中的VM 相当于  vue 中的 store
>> widgets 全局 widget 组件集
>> config.dart 全局配置文件
>> event_bus.dart 事件处理集
>> main.dart   入口文件

### 集成了一些 flutter 基础周边插件。
+ ui 部分
  1. 豆瓣 B站 等列表展示部分。
  2. GridView Demo.
+ 插件 部分
  1. http 请求 - dio: ^3.0.9
  2. 状态管理 - provider: ^4.0.4
  3. 事件处理- event_bus: ^1.1.1
  4. 图库 相机 图片选择 - image_picker: ^0.6.7+21
  5. 打开浏览器 写邮件 打电话 发短信 - url_launcher: ^5.7.10
  6. 待添加 shared_preferences(本地化) webview_flutter(app内打开浏览器) share(分享) permission_handler(权限) flutter_easyrefresh(上拉加载，下拉刷新)...
+ 

  
+ other
1. 如果您有更好的建议，意见请评论与我交流或微信（bb_c_e_f）联系我。
2. ...



+ 特别说明：
  + map 地图使用 高德 （仅做了安卓集成） 
    集成方法参考： https://lbs.amap.com/api/flutter/guide/map-flutter-plug-in/map-flutter-info