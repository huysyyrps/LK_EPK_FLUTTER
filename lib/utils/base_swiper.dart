import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

const List<String> defaultImages = [
  'static/banner/banner1.jpg',
  'static/banner/banner2.jpg',
  'static/banner/banner3.jpg',
  'static/banner/banner4.jpg',
];

class BaseSwiper extends StatelessWidget {
  final List<String> images;

  const BaseSwiper({Key? key, this.images = defaultImages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, //这里是你期望的颜色
      body: SafeArea(
        child: Swiper(
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              images[index],
              fit: BoxFit.fill,
            );
          },
          itemCount: images.length,
          pagination: const SwiperPagination(),
          // control: const SwiperControl(),
        ),
      ),
    );
  }
}