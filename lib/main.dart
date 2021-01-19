import 'package:flutter/material.dart';
// utils
import 'package:flutter_scaffold/utils/size_fit.dart';
/// provider
import 'package:provider/provider.dart';
/// route
import 'package:flutter_scaffold/router/router.dart';
/// providers
import 'package:flutter_scaffold/viewModel/initialize_providers.dart';
import 'package:flutter_scaffold/viewModel/app_view_model.dart';
// config
import 'package:flutter_scaffold/config.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CsSizeFit.initialize();
    return Consumer<AppViewModel>(
      builder: (context,appVM,child){
        return MaterialApp(
          title: AppConfig.title,
          themeMode: appVM.currentThemeMode,
          theme: appVM.copyLightTheme(),
          darkTheme: appVM.copyDarkTheme(),
          showPerformanceOverlay: appVM.showPerformanceOverlay,
          routes: CsRouter.routes,
          initialRoute: CsRouter.initialRoute,
          onGenerateRoute: CsRouter.onGenerateRoute,
          onUnknownRoute: CsRouter.onUnknownRoute
        );
      }
    );
  }
}