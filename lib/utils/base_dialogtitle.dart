import 'package:flutter/material.dart';
import 'package:lk_epk/data/base_data.dart';

class BaseDialogTitle extends StatelessWidget {
  const BaseDialogTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: Colors.grey[850],
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 20,
                  width: 20,
                  margin: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                  child: const Image(
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    image: AssetImage("static/image/ic_logo.jpg"),
                  ),
                ),
                Text(
                  BaseData().title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
