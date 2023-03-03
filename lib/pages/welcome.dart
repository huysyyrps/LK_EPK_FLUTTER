import 'package:flutter/material.dart';
import 'package:lk_epk/data/base_data.dart';
import 'package:lk_epk/file/path_provider.dart';
import 'package:lk_epk/utils/base_fluro.dart';
import 'package:lk_epk/utils/base_swiper.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //判断有没有材料文本，有的话跳过，没有创建写入
    checkData();
  }

  checkData() async {
    String s = await BasePathProvider().readString();
    if (s == null || s == "") {
      await BasePathProvider().writeString(BaseData().materialTypeData);
    }
    // else {
    //   print(s);
    // }
  }

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
