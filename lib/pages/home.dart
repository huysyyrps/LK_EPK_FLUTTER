import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lk_epk/pages/chart/line_chart.dart';
import 'package:lk_epk/pages/webview/phone_webview.dart';
import 'package:lk_epk/pages/webview/window_webview.dart';
import 'package:lk_epk/utils/base_devices_parame.dart';
import 'package:lk_epk/utils/base_direction.dart';
import 'package:lk_epk/utils/base_function_button.dart';
import 'package:lk_epk/utils/base_heard.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Row(
        children: [
          Expanded(
              flex: 8,
              child: Container(
                color: Colors.black87,
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child:
                          deviceTag ? VideoPhoneWidget() : VideoWindowWidget(),
                    ),
                    Expanded(
                      flex: 6,
                      child: LineCharts(listData: listData),
                    ),
                  ],
                ),
              )),
          Container(
            // color: Colors.yellow[800],
            width: 1,
            margin: const EdgeInsets.fromLTRB(2, 4, 2, 0),
          ),
          Expanded(
              flex: 4,
              child: Column(
                children: [
                  Container(
                    height: 4,
                    color: Colors.black87,
                  ),
                  const BaseHeard(
                    title: "功能按键",
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  const BaseFunctionButton(),
                  const SizedBox(
                    height: 4,
                  ),
                  const BaseHeard(
                    title: "设备参数",
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  const BaseDevicesParme(
                      title: "电池电压", data: "10V", title1: "电池电压", data1: "10V"),
                  const BaseDevicesParme(
                      title: "电池电压", data: "10V", title1: "电池电压", data1: "10V"),
                  const BaseDevicesParme(
                      title: "电池电压", data: "10V", title1: "电池电压", data1: "10V"),
                  const SizedBox(
                    height: 4,
                  ),
                  const BaseHeard(
                    title: "方向控制",
                  ),
                  BaseDirection(),
                ],
              )),
        ],
      ),
    );
  }
}
