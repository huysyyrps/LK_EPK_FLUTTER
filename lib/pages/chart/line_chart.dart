import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lk_epk/utils/base_button.dart';
import 'package:lk_epk/utils/base_text.dart';

class LineCharts extends StatefulWidget {
  final List<FlSpot> listData;

  const LineCharts({super.key, required this.listData});

  // const LineCharts({super.key, required this.listData});

  @override
  State<LineCharts> createState() => _LineChartsState();
}

void btnStopSelect() {
  print("停止");
}

void btnSaveSelect() {
  print("存储");
}

class _LineChartsState extends State<LineCharts> {
  double rangeAddNum = 80;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
        children: <Widget>[
          LineChart(
            LineChartData(
              minY: 0,
              maxY: 30,
              clipData: FlClipData.all(),
              lineTouchData: LineTouchData(enabled: false),
              lineBarsData: [
                LineChartBarData(
                  // spots: TestData().setData(),
                  spots: widget.listData,
                  //弯曲
                  isCurved: true,
                  //曲线颜色
                  color: Colors.yellow[800],
                  //曲线宽度
                  barWidth: 1,
                  //是否显示节点
                  dotData: FlDotData(
                    show: false,
                  ),
                ),
              ],
              // //网格
              // gridData: FlGridData(
              //   show: true,
              //   drawHorizontalLine: true,
              //   drawVerticalLine: true,
              //   getDrawingHorizontalLine: (value) {
              //     return FlLine(
              //       color: const Color(0xff37434d),
              //       strokeWidth: 1,
              //     );
              //   },
              //   getDrawingVerticalLine: (value) {
              //     return FlLine(
              //       color: const Color(0xff37434d),
              //       strokeWidth: 1,
              //     );
              //   },
              // ),
              // titlesData: FlTitlesData(
              //   show: true,
              //   bottomTitles: AxisTitles(
              //     axisNameSize: 12,
              //   ),
              //   leftTitles: AxisTitles(
              //     axisNameSize: 12,
              //   ),
              //   rightTitles: AxisTitles(
              //     axisNameSize: 12,
              //   ),
              // ),
              //边框线设置
              borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.yellow[800]!, width: 1)),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  drawBehindEverything: false,
                  axisNameWidget: bottonWeidget(),
                ),
                leftTitles: AxisTitles(
                  axisNameWidget: leftWeidget(),
                ),
                topTitles: AxisTitles(
                    sideTitles: SideTitles(
                  showTitles: false,
                )),
                rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                  showTitles: false,
                )),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Row(
              children: [
                Visibility(
                    visible: false,
                    child: Row(
                      children: [
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 12 * 8 - 200,
                          child: NeumorphicSlider(
                            min: 0,
                            max: 100,
                            height: 8,
                            value: rangeAddNum,
                            onChanged: (value) {
                              setState(() {
                                rangeAddNum = value;
                              });
                            },
                          ),
                        ),
                        Text(
                          "${rangeAddNum.floor()}",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    )),
                const SizedBox(
                  width: 30,
                ),
                Container(
                  height: 45,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow[800]!, width: 2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Text(
                    "data",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.red),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  children: const [
                    BaseButton(text: "停止", bunSlelct: btnStopSelect),
                    SizedBox(
                      height: 5,
                    ),
                    BaseButton(text: "存储", bunSlelct: btnSaveSelect),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget bottonWeidget() {
  return Container(
    color: Colors.black,
    height: 15,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        BaseText(data: "0"),
        BaseText(data: "10"),
        BaseText(data: "20"),
        BaseText(data: "30"),
        BaseText(data: "40"),
        BaseText(data: "50"),
        BaseText(data: "60"),
        BaseText(data: "70"),
        BaseText(data: "80"),
      ],
    ),
  );
}

Widget leftWeidget() {
  return Container(
    color: Colors.black,
    height: 15,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        BaseText(data: "0"),
        BaseText(data: "20"),
        BaseText(data: "40"),
        BaseText(data: "60"),
        BaseText(data: "80"),
        BaseText(data: "100"),
      ],
    ),
  );
}
