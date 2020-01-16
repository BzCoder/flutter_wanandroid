import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_wanandroid/page/main_page.dart';
import 'package:flutter_wanandroid/provider/theme_provider.dart';
import 'package:flutter_wanandroid/routers/application.dart';
import 'package:flutter_wanandroid/routers/routers.dart';
import 'package:flutter_wanandroid/util/log_utils.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'i18n/localization.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    // 透明状态栏
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  final Widget home;

  MyApp({this.home}) {
    Log.init();
    _initRouter();
  }

  void _initRouter() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
          child: Consumer<ThemeProvider>(
            builder: (_, provider, __) {
              return MaterialApp(
//              showPerformanceOverlay: true, //显示性能标签
//              debugShowCheckedModeBanner: false,
//              checkerboardRasterCacheImages: true,
//              showSemanticsDebugger: true, // 显示语义视图
                theme: provider.getTheme(),
                darkTheme: provider.getTheme(isDarkMode: true),
                home: MainPage(),
                  onGenerateRoute: Application.router.generator,
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    RefreshLocalizations.delegate,
                    AppLocalizationsDelegate()
                  ],
                  supportedLocales: const [
                    Locale('zh', 'CH'),
                    Locale('en', 'US')
                  ]
              );
            },
          ),
        ),

        /// Toast 配置
        backgroundColor: Colors.black54,
        textPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.bottom);
  }
}
