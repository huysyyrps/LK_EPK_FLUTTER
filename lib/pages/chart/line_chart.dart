import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lk_epk/utils/test_data.dart';

class LineCharts extends StatefulWidget {
  final List<FlSpot> listData;

  const LineCharts({super.key, required this.listData});

  @override
  State<LineCharts> createState() => _LineChartsState();
}

class _LineChartsState extends State<LineCharts> {
  @override
  Widget build(BuildContext context) {
    const cutOffYValue = 0.0;
    const yearTextStyle = TextStyle(fontSize: 12, color: Colors.black);
    return SizedBox(
      child: LineChart(
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
        Text("0", style: TextStyle(fontSize: 10)),
        Text("10", style: TextStyle(fontSize: 10)),
        Text("20", style: TextStyle(fontSize: 10)),
        Text("30", style: TextStyle(fontSize: 10)),
        Text("40", style: TextStyle(fontSize: 10)),
        Text("50", style: TextStyle(fontSize: 10)),
        Text("60", style: TextStyle(fontSize: 10)),
        Text("70", style: TextStyle(fontSize: 10)),
        Text("80", style: TextStyle(fontSize: 10)),
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
        Text("0", style: TextStyle(fontSize: 10)),
        Text("20", style: TextStyle(fontSize: 10)),
        Text("40", style: TextStyle(fontSize: 10)),
        Text("60", style: TextStyle(fontSize: 10)),
        Text("80", style: TextStyle(fontSize: 10)),
        Text("100", style: TextStyle(fontSize: 10)),
      ],
    ),
  );
}
