import 'package:flutter/material.dart';
import 'package:lk_epk/constant/base_url.dart';
import 'package:webview_windows/webview_windows.dart';

class VideoWindowWidget extends StatefulWidget {
  const VideoWindowWidget({super.key});

  @override
  State<VideoWindowWidget> createState() => _VideoWindowWidgetState();
}

class _VideoWindowWidgetState extends State<VideoWindowWidget> {
  final WebviewController _webViewController = WebviewController();
  @override
  void initState() {
    super.initState();
    initWebState();
  }

  Future<void> initWebState() async {
    try {
      await _webViewController.initialize();
      await _webViewController.loadUrl(Point.BASEURL);
      _webViewController.webMessage.listen((event) {});
      setState(() {});
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Webview(
        _webViewController,
      ),
    );
  }
}
