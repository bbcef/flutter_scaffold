import 'package:flutter/material.dart';
// 国际化
import 'package:flutter_localizations/flutter_localizations.dart';
// 
import 'dart:io';
import 'package:flutter/services.dart';
/// provider
import 'package:provider/provider.dart';
/// route
import 'package:flutter_scaffold/router/router.dart';
/// providers
import 'package:flutter_scaffold/viewModel/initialize_providers.dart';
import 'package:flutter_scaffold/viewModel/app_view_model.dart';
// config
import 'package:flutter_scaffold/config.dart';
// botToat 
import 'package:bot_toast/bot_toast.dart';
// flutter 工具
import 'package:flustars/flustars.dart';
// 设备信息
import 'package:package_info/package_info.dart';
// 本地存储
import 'package:flutter_scaffold/utils/storage_utils.dart';
// 推送
import 'package:jpush_flutter/jpush_flutter.dart';


void main() async {

  // 初始化本地存储
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  // 透明状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runApp(
    MultiProvider(
      providers: providers,
      child: isGreyWidget()
    )
  );
}


Widget isGreyWidget(){
  if (AppConfig.isGrey == true) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.white, BlendMode.color),
      child: MyApp()
    );
  } else {
    return MyApp();
  } 
  
}




class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  String debugLable = 'Unknown';
  final JPush jpush = new JPush();

  void _getInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    StorageUtils.saveString(Key_LastVersion, packageInfo.version);
  }
  // Jpush
  Future<void> initPlatformState() async {
    String platformVersion;

    try {
      jpush.addEventHandler(
          onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotification: $message");
        setState(() {
          debugLable = "flutter onReceiveNotification: $message";
        });
      }, onOpenNotification: (Map<String, dynamic> message) async {
        print("flutter onOpenNotification: $message");
        setState(() {
          debugLable = "flutter onOpenNotification: $message";
        });
      }, onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");
        setState(() {
          debugLable = "flutter onReceiveMessage: $message";
        });
      }, onReceiveNotificationAuthorization:
              (Map<String, dynamic> message) async {
        print("flutter onReceiveNotificationAuthorization: $message");
        setState(() {
          debugLable = "flutter onReceiveNotificationAuthorization: $message";
        });
      });
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    jpush.setup(
      appKey: "10694ed3021ac7d37a36dd14", //你自己应用的 AppKey
      channel: "theChannel",
      production: false,
      debug: true,
    );
    jpush.applyPushAuthority(
        new NotificationSettingsIOS(sound: true, alert: true, badge: true));

    // Platform messages may fail, so we use a try/catch PlatformException.
    jpush.getRegistrationID().then((rid) {
      print("flutter get registration id : $rid");
      setState(() {
        debugLable = "flutter getRegistrationID: $rid";
      });
    });

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      debugLable = platformVersion;
    });
  }
  @override
  void initState() {
    super.initState();
    _getInfo();
    
    initPlatformState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
        builder: (context,appVM,child){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppConfig.title,
            themeMode: appVM.currentThemeMode,
            theme: appVM.copyLightTheme(),
            darkTheme: appVM.copyDarkTheme(),
            showPerformanceOverlay: appVM.showPerformanceOverlay,
            routes: CsRouter.routes,
            initialRoute: CsRouter.initialRoute,
            onGenerateRoute: CsRouter.onGenerateRoute,
            onUnknownRoute: CsRouter.onUnknownRoute,
            // 
            localizationsDelegates: [
              GlobalCupertinoLocalizations.delegate, //添加这行即可解决问题
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: [
              Locale('zh', 'CN'),
            ],
            // BotToastInit
            builder: BotToastInit(),
            navigatorObservers: [BotToastNavigatorObserver()],
          );
        }
    );
  }
}




