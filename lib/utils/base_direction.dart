import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lk_epk/utils/base_joypad.dart';

class BaseDirection extends StatefulWidget {
  const BaseDirection({super.key});

  @override
  State<BaseDirection> createState() => _BaseDirectionState();
}

class _BaseDirectionState extends State<BaseDirection> {
  double _top = 60.0; //距顶部的偏移
  double _left = 60.0; //距左边的偏移

  void _onChange(Offset delta) {
    print(delta);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Joypad(
      onChange: _onChange,
    ));
  }
}
