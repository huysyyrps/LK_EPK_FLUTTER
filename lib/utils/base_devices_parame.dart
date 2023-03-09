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
      height: 49,
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
    );
  }
}
