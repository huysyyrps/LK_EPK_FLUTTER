import 'dart:math';

import 'package:flutter/material.dart';

class BaseDirection extends StatefulWidget {
  const BaseDirection({super.key});

  @override
  State<BaseDirection> createState() => _BaseDirectionState();
}

class _BaseDirectionState extends State<BaseDirection> {
  double _top = 60.0; //距顶部的偏移
  double _left = 60.0; //距左边的偏移
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        width: 170,
        height: 170,
        decoration: BoxDecoration(
            color: Colors.yellow[800],
            borderRadius: const BorderRadius.all(Radius.circular(100))),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: _top,
              left: _left,
              child: GestureDetector(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                ),
                //手指按下时会触发此回调
                onPanDown: (DragDownDetails e) {
                  //打印手指按下的位置(相对于屏幕)
                  print("用户手指按下：${e.globalPosition}");
                },
                //手指滑动时会触发此回调
                onPanUpdate: (DragUpdateDetails e) {
                  //用户手指滑动时，更新偏移，重新构建
                  setState(() {
                    if (e.globalPosition.dx >
                        MediaQuery.of(context).size.width / 12 * 10 + 90) {
                      _left += 1;
                    } else if (e.delta.dx < -1) {
                      _left += -1;
                    } else {
                      _left += e.delta.dx;
                    }
                    if (e.delta.dy > 1) {
                      _top += 1;
                    } else if (e.delta.dy < -1) {
                      _top += -1;
                    } else {
                      _top += e.delta.dy;
                    }

                    // _left = e.globalPosition.dx;
                    // _top = e.globalPosition.dy;
                    print("滑动：${e.delta.dx}+${e.delta.dy}");
                  });
                },
                onPanEnd: (DragEndDetails e) {
                  //打印滑动结束时在x、y轴上的速度
                  print("111111111111");
                  _top = 60.0; //距顶部的偏移
                  _left = 60.0;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
