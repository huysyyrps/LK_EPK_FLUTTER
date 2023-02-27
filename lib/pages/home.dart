import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lk_epk/pages/chart/line_chart.dart';
import 'package:lk_epk/pages/webview/phone_webview.dart';
import 'package:lk_epk/pages/webview/window_webview.dart';
import 'package:lk_epk/utils/base_option.dart';
import 'package:lk_epk/utils/test_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool deviceTag = Platform.isAndroid ? true : false;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    setData();
  }

  List<FlSpot> listData = [];
  var someCondition = false;
  setData() {
    Timer.periodic(Duration(milliseconds: 200), (timer) {
      List<FlSpot> listData1 = [];
      var rng = Random();
      for (int i = 0; i < 300; i++) {
        listData1.add(FlSpot(i.toDouble(), rng.nextInt(20).toDouble()));
      }
      setState(() {
        this.listData = listData1;
      });
      // 循环一定要记得设置取消条件，手动取消
      if (someCondition) {
        timer.cancel();
      }
    });
    // return listData;
  }

  text() {
    print("1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 8,
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: deviceTag ? VideoPhoneWidget() : VideoWindowWidget(),
                  ),
                  Expanded(
                    flex: 6,
                    child: LineCharts(listData: listData),
                  ),
                ],
              )),
          Container(
            color: Colors.yellow[800],
            width: 1,
            margin: const EdgeInsets.fromLTRB(2, 4, 2, 0),
          ),
          Expanded(
              flex: 4,
              child: Container(
                color: Colors.black12,
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2,
                  ),
                  children: [
                    BaseOption(
                      title: "闸门",
                      data: "自动",
                      btnSelect: text,
                    ),
                    BaseOption(
                      title: "闸门",
                      data: "自动",
                      btnSelect: text,
                    ),
                    BaseOption(
                      title: "闸门",
                      data: "自动",
                      btnSelect: text,
                    ),
                    BaseOption(
                      title: "闸门",
                      data: "自动",
                      btnSelect: text,
                    ),
                    BaseOption(
                      title: "闸门",
                      data: "自动",
                      btnSelect: text,
                    ),
                    BaseOption(
                      title: "闸门",
                      data: "自动",
                      btnSelect: text,
                    ),
                    BaseOption(
                      title: "闸门",
                      data: "自动",
                      btnSelect: text,
                    ),
                    BaseOption(
                      title: "闸门",
                      data: "自动",
                      btnSelect: text,
                    ),
                    BaseOption(
                      title: "闸门",
                      data: "自动",
                      btnSelect: text,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
