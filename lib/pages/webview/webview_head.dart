import 'package:flutter/material.dart';

class WebViewHead extends StatefulWidget {
  const WebViewHead({super.key});

  @override
  State<WebViewHead> createState() => _WebViewHeadState();
}

class _WebViewHeadState extends State<WebViewHead> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // color: Colors.grey[850],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [],
      ),
    );
  }
}
