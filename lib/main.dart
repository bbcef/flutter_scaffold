import 'package:flutter/material.dart';
/// config
import 'package:flutter_scaffold/config.dart';
// utils
import 'package:flutter_scaffold/utils/size_fit.dart';
import 'package:flutter_scaffold/viewModel/app_view_model.dart';
/// provider
import 'package:provider/provider.dart';
/// route
import 'package:flutter_scaffold/router/router.dart';
/// providers
import 'package:flutter_scaffold/viewModel/initialize_providers.dart';

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
          title: 'Flutter Scaffold',
          theme: appVM.currentTheme,
          // darkTheme: ThemeConfig.darkTheme,
          routes: CsRouter.routes,
          initialRoute: CsRouter.initialRoute,
          onGenerateRoute: CsRouter.onGenerateRoute,
          onUnknownRoute: CsRouter.onUnknownRoute
        );
      }
    );
  }
}