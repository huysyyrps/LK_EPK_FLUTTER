import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseOption extends StatelessWidget {
  final String title;
  final String data;
  final Function btnSelect;

  const BaseOption(
      {super.key,
      required this.title,
      required this.data,
      required this.btnSelect});

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.all(0),
      color: Colors.black87, //使用Ink包裹，在这里设置颜色
      child: InkWell(
        splashColor: Colors.red,
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
              Container(
                child: Text(data),
                padding: EdgeInsets.fromLTRB(20, 4, 20, 4),
                decoration: BoxDecoration(
                    color: Colors.yellow[800],
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
              ),
            ],
          ),
        ),
        onTap: () {
          btnSelect();
        },
      ),
    );
  }
}
