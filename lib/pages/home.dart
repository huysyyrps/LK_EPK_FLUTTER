import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lk_epk/pages/webview/phone_webview.dart';
import 'package:lk_epk/pages/webview/webview_head.dart';
import 'package:lk_epk/pages/webview/window_webview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool deviceTag = Platform.isAndroid ? true : false;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            flex: 7,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: deviceTag ? VideoPhoneWidget() : VideoPhoneWidget(),
                ),
                Expanded(
                  flex: 1,
                  child: deviceTag ? VideoPhoneWidget() : VideoPhoneWidget(),
                ),
              ],
            )),
        Expanded(
            flex: 3,
            child: Container(
              color: Colors.black,
            )),
      ],
    );
  }
}
