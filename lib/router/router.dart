import 'package:flutter/material.dart';
import 'package:flutter_scaffold/pages/app/theme_setting/index.dart';
import 'package:flutter_scaffold/pages/app/unknow/index.dart';
import 'package:flutter_scaffold/pages/home/index.dart';
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
import 'package:flutter_scaffold/utils/navigator.dart';
import 'package:flutter_scaffold/widgets/cs_image_preview.dart';
import 'package:flutter_scaffold/pages/modules/image_picker/index.dart';
import 'package:flutter_scaffold/pages/modules/amap_flutter_map/index.dart';

class CsRouter{
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => MainPage(),
    '/unknow': (context) => MainPage(),
    '/theme_setting': (context) => ThemeSettingPage(),
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
    
    
    
  
  };

  static final String initialRoute = '/';

  static RouteFactory onGenerateRoute = (settings){
    switch (settings.name) {
      // 单图片 预览
      case CsImagePreview.routeName:
        return MaterialPageRoute(
        builder: (context){
          return CsImagePreview(settings.arguments);
        }
      );
      // 自定义icon
      case '/custom_icon':
        return Right2LeftRouter(
            child: CoustomIconPage());
    }
  };

  static RouteFactory onUnknownRoute = (settings){
    return MaterialPageRoute(
      builder: (context) => UnknowPage()
    );
  };
}