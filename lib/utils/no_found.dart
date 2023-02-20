import 'package:flutter/material.dart';

class NoFountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("404"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("当前页面不存在"),
      ),
    );
  }
}
