import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lk_epk/pages/welcome.dart';
import 'package:lk_epk/utils/base_fluro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
//在initState函数下打开页面的时候系统执行代码即可锁定固定模式
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]); //隐藏状态栏，保留底部按钮栏
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FluroRouter router = FluroRouter();
    BaseFluro.configureRoutes(router);
    // ThemeData themeData = Theme.of(context);
    return MaterialApp(
      onGenerateRoute: router.generator,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          //primary: Colors.green,
          primary: Colors.yellow.shade800, //主题颜色
          onPrimary: Colors.white, //主题字体颜色
          onBackground: Colors.pink,
          secondary: Colors.amber,
        ),
      ),
      home: const WelcomePage(),
    );
  }
}
