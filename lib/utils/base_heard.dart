import 'package:flutter/material.dart';

class BaseHeard extends StatefulWidget {
  final String title;

  const BaseHeard({super.key, required this.title});

  @override
  State<BaseHeard> createState() => _BaseHeardState();
}

class _BaseHeardState extends State<BaseHeard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      height: 30,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: Row(
        children: [
          Container(
            color: Colors.red,
            width: 4,
            height: 15,
            margin: const EdgeInsets.fromLTRB(1, 0, 5, 0),
          ),
          Expanded(
            flex: 1,
            child: Text(
              widget.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
