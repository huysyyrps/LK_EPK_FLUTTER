import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lk_epk/utils/base_option.dart';
import 'package:lk_epk/utils/base_parameter.dart';

class BaseDevicesParme extends StatefulWidget {
  final String title;
  final String data;
  final String title1;
  final String data1;

  const BaseDevicesParme({
    super.key,
    required this.title,
    required this.data,
    required this.title1,
    required this.data1,
  });

  @override
  State<BaseDevicesParme> createState() => _BaseDevicesParmeState();
}

class _BaseDevicesParmeState extends State<BaseDevicesParme> {
  text() {
    print("1");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 12 * 4,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: BaseParameter(
                  title: widget.title,
                  data: widget.data,
                ),
              ),
              const SizedBox(
                width: 1,
              ),
              Expanded(
                flex: 1,
                child: BaseParameter(
                  title: widget.title1,
                  data: widget.data1,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 1,
          )
        ],
      ),
      // child: Column(
      //   children: [
      //     Container(
      //       padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      //       alignment: Alignment.centerLeft,
      //       child: Text(
      //         widget.title,
      //         style: const TextStyle(fontSize: 12, color: Colors.white),
      //       ),
      //     ),
      //     Container(
      //       height: 30,
      //       padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      //       alignment: Alignment.centerLeft,
      //       decoration: BoxDecoration(
      //           color: Colors.yellow[800],
      //           borderRadius: const BorderRadius.all(Radius.circular(2))),
      //       child: Text(widget.data),
      //     ),
      //   ],
      // ),
    );
  }
}
