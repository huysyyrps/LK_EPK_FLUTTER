import 'package:flutter/material.dart';

class BaseButton extends StatefulWidget {
  final String text;
  final Function bunSlelct;

  const BaseButton({super.key, required this.text, required this.bunSlelct});

  @override
  State<BaseButton> createState() => _BaseButtonState();
}

class _BaseButtonState extends State<BaseButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 20,
        width: 50,
        child: ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.focused) &&
                      !states.contains(MaterialState.pressed)) {
                    //获取焦点时的颜色
                    return Colors.blue;
                  } else if (states.contains(MaterialState.pressed)) {
                    //按下时的颜色
                    return Colors.red[800];
                  }
                  //默认状态使用灰色
                  return Colors.yellow[800];
                },
              ),
            ),
            onPressed: (() {
              widget.bunSlelct();
            }),
            child: Text(
              widget.text,
              style: const TextStyle(fontSize: 12),
            )));
  }
}
