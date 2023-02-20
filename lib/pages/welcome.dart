import 'package:flutter/material.dart';
import 'package:lk_epk/utils/base_fluro.dart';
import 'package:lk_epk/utils/base_swiper.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
      children: <Widget>[
        const BaseSwiper(),
        Positioned(
          bottom: 30,
          child: SizedBox(
            height: 45,
            width: 120,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.focused) &&
                        !states.contains(MaterialState.pressed)) {
                      //获取焦点时的颜色
                      return Colors.blue;
                    } else if (states.contains(MaterialState.pressed)) {
                      //按下时的颜色
                      return Colors.red[800];
                    }
                    //默认状态使用灰色
                    return Colors.yellow[800];
                  },
                ),
              ),
              onPressed: () {
                // final router = FluroRouter();
                Navigator.pushReplacementNamed(
                    context, BaseFluro.homepage); // getDataTime(context);
              },
              child: const Text(
                "进入程序",
              ),
            ),
          ),
        )
      ],
    );
  }
}
