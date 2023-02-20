import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadionButton extends StatelessWidget {
  final Icon icon;
  final String title;

  const RadionButton({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: Colors.grey[850], //使用Ink包裹，在这里设置颜色
      child: InkWell(
        splashColor: Colors.red,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
          child: Column(
            children: [
              icon,
              Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ),
        onTap: () {
          print('message');
        },
      ),
    );
  }
}
