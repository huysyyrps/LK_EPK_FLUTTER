import 'package:flutter/material.dart';
import 'package:lk_epk/fun/base_dialog.dart';
import 'package:lk_epk/utils/base_option.dart';

class BaseFunctionButton extends StatefulWidget {
  const BaseFunctionButton({super.key});

  @override
  State<BaseFunctionButton> createState() => _BaseFunctionButtonState();
}

class _BaseFunctionButtonState extends State<BaseFunctionButton> {
  text() {
    print("1");
  }

  bool _switchTag = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(0),
                  color: Colors.black87,
                  child: Column(
                    children: [
                      const Text(
                        "自动增益",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      Container(
                        height: 34,
                        child: Switch(
                          value: _switchTag,
                          activeColor: Colors.yellow[800],
                          activeTrackColor: Colors.yellow[800],
                          inactiveThumbColor: Colors.yellow[800],
                          inactiveTrackColor: Colors.grey,
                          onChanged: (value) {
                            setState(() {
                              _switchTag = value;
                            });
                          },
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 1,
              ),
              Expanded(
                flex: 1,
                child: BaseOption(
                  title: "闸门",
                  data: "自动",
                  btnSelect: text,
                ),
              ),
              const SizedBox(
                width: 1,
              ),
              Expanded(
                flex: 1,
                child: BaseOption(
                  title: "平均等级",
                  data: "自动",
                  btnSelect: text,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 1,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: BaseOption(
                  title: "材料类型",
                  data: "自动",
                  btnSelect: text,
                ),
              ),
              const SizedBox(
                width: 1,
              ),
              Expanded(
                flex: 1,
                child: BaseOption(
                  title: "检波方式",
                  data: "自动",
                  btnSelect: text,
                ),
              ),
              const SizedBox(
                width: 1,
              ),
              Expanded(
                flex: 1,
                child: BaseOption(
                  title: "范围扩展",
                  data: "自动",
                  btnSelect: text,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 1,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: BaseOption(
                  title: "工作温度",
                  data: "自动",
                  btnSelect: text,
                ),
              ),
              const SizedBox(
                width: 1,
              ),
              Expanded(
                flex: 1,
                child: BaseOption(
                  title: "声速（m/s）",
                  data: "自动",
                  btnSelect: text,
                ),
              ),
              const SizedBox(
                width: 1,
              ),
              Expanded(
                flex: 1,
                child: BaseOption(
                  title: "参数初始",
                  data: "自动",
                  btnSelect: text,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
