
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherPage extends StatefulWidget {
  @override
  _UrlLauncherPageState createState() => _UrlLauncherPageState();
}

class _UrlLauncherPageState extends State<UrlLauncherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('url_launcher 插件 Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: _launchURL,
              child: Text('浏览器 打开 flutter官网'),
            ),
            RaisedButton(
              onPressed: _launchEmail,
              child: Text('邮件 发送邮件'),
            ),
            RaisedButton(
              onPressed: _launchTEL,
              child: Text('电话 13888888888'),
            ),
            RaisedButton(
              onPressed: _launchSMS,
              child: Text('发送信息'),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: RaisedButton(
                onPressed: _launchApp,
                child: Text('打开第三方应用'),
              ),
            )
          ],
        )
      ),
    );
  }
}
// 打开浏览器
_launchURL() async {
  const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw '无法启动 $url';
  }
}
// 发送邮件
_launchEmail() async {
  String email = 'mailto:961166897@qq.com?subject=News&body=New%20plugin';
  if (await canLaunch(email)) {
    await launch(email);
  } else {
    throw '无法启动 $email';
  }
}
// 拨打电话
_launchTEL() async {
  String phone = '13888888888';
  final String tel = 'tel:' + phone;
  if (await canLaunch(tel)) {
    await launch(tel);
  } else {
    throw '无法启动 $phone';
  }
}
// 发送短信
_launchSMS() async {
  String sms = 'sms:13888888888';
  if (await canLaunch(sms)) {
    await launch(sms);
  } else {
    throw '无法启动 $sms';
  }
}
// 打开第三方应用 (更多 https://www.cnblogs.com/killbugme/p/13601832.html)
_launchApp() async {
  String app = 'weixin://';
  if (await canLaunch(app)) {
    await launch(app);
  } else {
    throw '无法启动 $app';
  }
}
