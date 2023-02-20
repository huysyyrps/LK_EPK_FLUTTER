import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:lk_epk/pages/home.dart';

class BaseFluro {
  //定义路由名称
  static String homepage = '/homepage';

  //定义路由处理函数
  static final Handler _notfountHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    // return NoFountPage();
  });
  static final Handler _homepageHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const HomePage();
  });

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = _notfountHandler;
    router.define(homepage, handler: _homepageHandler);
  }
}
