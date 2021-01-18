import 'package:flutter/material.dart';
import 'package:flutter_scaffold/pages/app/unknow/index.dart';
import 'package:flutter_scaffold/pages/home/index.dart';
import 'package:flutter_scaffold/pages/modules/image_preview.dart';
import 'package:flutter_scaffold/pages/modules/router_page/router_page_form.dart';
import 'package:flutter_scaffold/pages/modules/router_page/router_page_to.dart';
import 'package:flutter_scaffold/pages/modules/url_launcher/index.dart';
import 'package:flutter_scaffold/pages/modules/view_model_page.dart';
import 'package:flutter_scaffold/widgets/cs_image_preview.dart';
import 'package:flutter_scaffold/pages/modules/b_movie_page/index.dart';
import 'package:flutter_scaffold/pages/modules/image_picker/index.dart';

class CsRouter{
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => MainPage(),
    '/unknow': (context) => MainPage(),
    viewModelPage.routeName: (context) => viewModelPage(),
    RouterPageForm.routeName: (context) => RouterPageForm(),
    RouterPageTo.routeName: (context) => RouterPageTo(),
    // '/cs_image_preview': (context) => CsImagePreview(),
    '/image_preview': (context) => ImagePreview(),
    '/b_movie_list': (context) => BMoviePage(),
    '/image_picker': (context) => ImagePickerPage(),
    '/url_launcher': (context) => UrlLauncherPage(),
  };

  static final String initialRoute = '/';

  static RouteFactory onGenerateRoute = (settings){
    if(settings.name == CsImagePreview.routeName){
      return MaterialPageRoute(
        builder: (context){
          return CsImagePreview(settings.arguments);
        }
      );
    }
    return null;
  };

  static RouteFactory onUnknownRoute = (settings){
    return MaterialPageRoute(
      builder: (context) => UnknowPage()
    );
  };
}