import 'package:flutter/material.dart';
import 'package:lk_epk/constant/base_url.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoPhoneWidget extends StatefulWidget {
  const VideoPhoneWidget({super.key});

  @override
  State<VideoPhoneWidget> createState() => _VideoPhoneWidgetState();
}

class _VideoPhoneWidgetState extends State<VideoPhoneWidget> {
  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..loadRequest(Uri.parse(Point.BASEURL));
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height / 11 * 5,
      child: WebViewWidget(controller: controller),
    );
  }
}
