import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lk_epk/file/path_provider.dart';
import 'package:lk_epk/model/bool_notification.dart';
import 'package:lk_epk/model/switchtag_context.dart';
import 'package:lk_epk/model/switchtag_model.dart';
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
  //switch状态
  bool switchTag = false;
  late SwitchTagModel switchTagModel;
  _initData() {
    switchTagModel = SwitchTagModel(switchTag);
  }

  @override
  void initState() {
    super.initState();
    //模拟数据
    setTestData();
    _initData();
  }

  //点击监听
  _switchclient() {
    setState(() {
      switchTagModel = SwitchTagModel(true);
    });
  }

  List<FlSpot> listData = [];
  var someCondition = false;
  setTestData() {
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

  //选项变量
  var gate = "自动"; //闸门
  var leave = "2"; //平均等级
  var materialType = "碳钢"; //材料类型
  var waveType = "射频波"; //检波方式
  var rangeAdd = "1X"; //范围扩展
  var workTemp = "25"; //工作温度
  var audioSpeed = "3254.0"; //声速
  void selectBackData(String tag, String backData) {
    setState(() {
      if (tag == "GATE") {
        gate = backData;
      } else if (tag == "LEAVE") {
        leave = backData;
      } else if (tag == "MATERIALTYPE") {
        materialType = backData.split(" ")[0];
        audioSpeed = backData.split(" ")[1];
      } else if (tag == "WAVETYPE") {
        waveType = backData;
      } else if (tag == "RANGEADD") {
        rangeAdd = backData;
      } else if (tag == "WORKTEMP") {
        workTemp = backData;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<BoolNotification>(
      onNotification: (notification) {
        switchTag = notification.switchClient;
        print(notification.switchClient);
        return true;
      },
      child: Scaffold(
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
                        child: deviceTag
                            ? const VideoPhoneWidget()
                            : const VideoWindowWidget(),
                      ),
                      Expanded(
                        flex: 6,
                        child: LineCharts(
                          listData: listData,
                          switchTag: switchTag,
                        ),
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
                child: ListView(
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
                    BaseFunctionButton(
                      selectBack: selectBackData,
                    ),
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
                        title: "电池电压",
                        data: "10V",
                        title1: "电池电压",
                        data1: "10V"),
                    const BaseDevicesParme(
                        title: "电池电压",
                        data: "10V",
                        title1: "电池电压",
                        data1: "10V"),
                    const BaseDevicesParme(
                        title: "电池电压",
                        data: "10V",
                        title1: "电池电压",
                        data1: "10V"),
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
      ),
    );
  }
}
