import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BaseText extends StatefulWidget {
  final String data;

  const BaseText({super.key, required this.data});

  @override
  State<BaseText> createState() => _BaseTextState();
}

class _BaseTextState extends State<BaseText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.data,
        textAlign: TextAlign.right,
        style: const TextStyle(
          fontSize: 10,
          color: Colors.red,
        ));
  }
}
