import 'dart:math';
import 'package:flutter/material.dart';

class Joypad extends StatefulWidget {
  final void Function(Offset) onChange;

  const Joypad({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  JoypadState createState() => JoypadState();
}

class JoypadState extends State<Joypad> {
  Offset delta = Offset.zero;

  void updateDelta(Offset newDelta) {
    widget.onChange(newDelta);
    setState(() {
      delta = newDelta;
    });
  }

  void calculateDelta(Offset offset) {
    Offset newDelta = offset - const Offset(75, 75);
    updateDelta(
      //为了移动Fly实例，需要使用fromDirection构造函数创建一个新的偏移（Offset），
      //该构造函数采用方向和可选距离，对于方向，只需要提供toTarget的方向属性，
      //对于距离，距离默认为1，我们输入已经计算好的stepDistance值。
      Offset.fromDirection(
        newDelta.direction,
        min(45, newDelta.distance),
      ),
    );
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(75),
        ),
        child: GestureDetector(
          onPanDown: onDragDown,
          onPanUpdate: onDragUpdate,
          onPanEnd: onDragEnd,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.yellow[800],
              borderRadius: BorderRadius.circular(75),
            ),
            child: Center(
              child: Transform.translate(
                offset: delta,
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xccffffff),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onDragDown(DragDownDetails d) {
    calculateDelta(d.localPosition);
  }

  void onDragUpdate(DragUpdateDetails d) {
    calculateDelta(d.localPosition);
  }

  void onDragEnd(DragEndDetails d) {
    updateDelta(Offset.zero);
  }
}
