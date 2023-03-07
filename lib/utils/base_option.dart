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
      padding: const EdgeInsets.all(0),
      height: 55,
      color: Colors.black87, //使用Ink包裹，在这里设置颜色
      child: InkWell(
        splashColor: Colors.red,
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
          // color: Colors.black87,
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
              Container(
                width: 80,
                padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                decoration: BoxDecoration(
                    color: Colors.yellow[800],
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Text(
                  data,
                  textAlign: TextAlign.center,
                ),
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
