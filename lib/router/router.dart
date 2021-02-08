import 'package:flutter/material.dart';
import 'package:flutter_scaffold/pages/app/index/index.dart';
import 'package:flutter_scaffold/pages/app/theme_setting/index.dart';
import 'package:flutter_scaffold/pages/app/unknow/index.dart';
import 'package:flutter_scaffold/pages/modules/banner/index.dart';
import 'package:flutter_scaffold/pages/modules/custom_icon/index.dart';
import 'package:flutter_scaffold/pages/modules/easyrefresh/index.dart';
import 'package:flutter_scaffold/pages/modules/image_preview.dart';
import 'package:flutter_scaffold/pages/modules/r_upgrade/index.dart';
import 'package:flutter_scaffold/pages/modules/router_page/router_page_form.dart';
import 'package:flutter_scaffold/pages/modules/router_page/router_page_to.dart';
import 'package:flutter_scaffold/pages/modules/share/index.dart';
import 'package:flutter_scaffold/pages/modules/shared_preferences/index.dart';
import 'package:flutter_scaffold/pages/modules/speak/index.dart';
import 'package:flutter_scaffold/pages/modules/url_launcher/index.dart';
import 'package:flutter_scaffold/pages/modules/utils/index.dart';
import 'package:flutter_scaffold/pages/modules/view_model_page.dart';
import 'package:flutter_scaffold/pages/modules/widget/index.dart';
import 'package:flutter_scaffold/utils/navigator.dart';
import 'package:flutter_scaffold/pages/modules/image_picker/index.dart';
import 'package:flutter_scaffold/pages/modules/amap_flutter_map/index.dart';
import 'package:flutter_scaffold/pages/modules/flutter_echarts/index.dart';
import 'package:flutter_scaffold/widgets/cs_web_view.dart';

class CsRouter{
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => IndexPage(),
    // '/unknow': (context) => MainPage(),
    '/theme_setting': (context) => ThemeSettingPage(),
    // '/webview': (context) => CsWebView(),
    // '/coustom_icon': (context) => CoustomIconPage(),

    
    viewModelPage.routeName: (context) => viewModelPage(),
    RouterPageForm.routeName: (context) => RouterPageForm(),
    RouterPageTo.routeName: (context) => RouterPageTo(),
    // '/cs_image_preview': (context) => CsImagePreview(),
    '/image_preview': (context) => ImagePreview(),
    '/image_picker': (context) => ImagePickerPage(),
    '/url_launcher': (context) => UrlLauncherPage(),
    '/share': (context) => SharePage(),
    '/amap_flutter_map': (context) => AmapFlutterMapPage(),
    '/shared_preferences': (context) => SharedPreferencesPage(),
    '/flutter_easyrefresh': (context) => EasyrefreshPage(),
    '/banner': (context) => BannerPage(),
    '/upgrade': (context) => UpgradePage(),
    '/utils': (context) => UtilsPage(),
    '/speak': (context) => SpeakPage(),
    '/widget': (context) =>  WidgetPage(),
    '/echarts': (context) =>  EchartsPage(),
    
    
    
  
  };

  static final String initialRoute = '/';

  // ignore: missing_return
  static RouteFactory onGenerateRoute = (settings){
    switch (settings.name) {
      // 自定义icon
      case '/custom_icon':
        return Right2LeftRouter(
          child: CoustomIconPage()
        );
        break;
      // webview
      case '/webview':
        return Right2LeftRouter(
          child: CsWebView(url: settings.arguments)
        );
        break;
    }
  };

  static RouteFactory onUnknownRoute = (settings){
    return MaterialPageRoute(
      builder: (context) => UnknowPage()
    );
  };
}