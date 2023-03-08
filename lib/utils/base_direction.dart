import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lk_epk/utils/joypad.dart';

class BaseDirection extends StatefulWidget {
  const BaseDirection({super.key});

  @override
  State<BaseDirection> createState() => _BaseDirectionState();
}

class _BaseDirectionState extends State<BaseDirection> {
  double _top = 60.0; //距顶部的偏移
  double _left = 60.0; //距左边的偏移

  void _onChange(Offset delta) {
    print(delta);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Joypad(
      onChange: _onChange,
    )
        // Container(
        //   width: 170,
        //   height: 170,
        //   decoration: BoxDecoration(
        //       color: Colors.yellow[800],
        //       borderRadius: const BorderRadius.all(Radius.circular(100))),
        //   child: Stack(
        //     children: <Widget>[
        //       Positioned(
        //         top: _top,
        //         left: _left,
        //         child: GestureDetector(
        //           child: Container(
        //             width: 50,
        //             height: 50,
        //             decoration: const BoxDecoration(
        //                 color: Colors.white70,
        //                 borderRadius: BorderRadius.all(Radius.circular(25))),
        //           ),
        //           //手指按下时会触发此回调
        //           onPanDown: (DragDownDetails e) {
        //             //打印手指按下的位置(相对于屏幕)
        //             print("用户手指按下：${e.globalPosition}");
        //           },
        //           //手指滑动时会触发此回调
        //           onPanUpdate: (DragUpdateDetails e) {
        //             //用户手指滑动时，更新偏移，重新构建
        //             setState(() {
        //               double phoneWidth = MediaQuery.of(context).size.width;
        //               if (e.globalPosition.dx >= phoneWidth / 12 * 10 + 60) {
        //                 _left = 120;
        //               } else if (e.globalPosition.dx <
        //                   phoneWidth / 12 * 10 - 60) {
        //                 _left = 0;
        //               } else {
        //                 _left += e.delta.dx;
        //               }

        //               double phoneHeight = MediaQuery.of(context).size.height;
        //               double yTop = phoneHeight - (phoneHeight - 447);
        //               double yBotton = phoneHeight - 40;
        //               if (e.globalPosition.dy < yTop) {
        //                 _top = 0;
        //               } else if (e.globalPosition.dy > yBotton) {
        //                 _top = 120;
        //               } else {
        //                 _top += e.delta.dy;
        //               }
        //             });
        //           },
        //           onPanEnd: (DragEndDetails e) {
        //             //打印滑动结束时在x、y轴上的速度
        //             print("111111111111");
        //             _top = 60.0; //距顶部的偏移
        //             _left = 60.0;
        //           },
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        );
  }
}
