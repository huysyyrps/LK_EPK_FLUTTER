import 'package:flutter/material.dart';

class BaseDirection extends StatefulWidget {
  const BaseDirection({super.key});

  @override
  State<BaseDirection> createState() => _BaseDirectionState();
}

class _BaseDirectionState extends State<BaseDirection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(180)),
          color: Colors.red),
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              print("上");
            },
            icon: Icon(
              Icons.arrow_drop_up,
              size: 35,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    print("左");
                  },
                  icon: Icon(
                    Icons.arrow_left,
                    size: 35,
                  )),
              IconButton(
                  onPressed: () {
                    print("停止");
                  },
                  icon: Icon(
                    Icons.arrow_drop_up,
                    size: 35,
                  )),
              IconButton(
                  onPressed: () {
                    print("右");
                  },
                  icon: Icon(
                    Icons.arrow_right,
                    size: 35,
                  )),
            ],
          ),
          IconButton(
              onPressed: () {
                print("下");
              },
              icon: Icon(Icons.arrow_right)),
        ],
      ),
    );
  }
}
