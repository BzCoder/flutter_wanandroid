import 'package:fluro/fluro.dart';
import 'package:flutter_wanandroid/page/login_page.dart';
import 'package:flutter_wanandroid/routers/router_init.dart';

/// 新闻页路由
///
/// author : BaoZhou
/// date : 2020-01-16 20:20
class NewsRouter implements IRouterProvider {
  static String webPage = '/webPage';

  @override
  void initRouter(Router router) {
    router.define(webPage,
        handler: Handler(handlerFunc: (_, params) => LoginPage()));
  }
}
