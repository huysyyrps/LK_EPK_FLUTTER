import 'package:flutter/material.dart';
import 'package:lk_epk/data/base_data.dart';
import 'package:lk_epk/utils/base_option.dart';

class BaseFunctionButton extends StatefulWidget {
  final Function selectBack;

  const BaseFunctionButton({super.key, required this.selectBack});

  @override
  State<BaseFunctionButton> createState() => _BaseFunctionButtonState();
}

class _BaseFunctionButtonState extends State<BaseFunctionButton> {
  text() {
    print("1");
  }

  bool _switchTag = false;
  String gate = "自动";
  String leave = "2"; //平均等级
  String materialType = "碳钢"; //材料类型
  String waveType = "射频波"; //检波方式
  String rangeAdd = "1X"; //范围扩展
  String workTemp = "25"; //工作温度

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
                    data: gate,
                    btnSelect: () {
                      _openSimpleDialog("GATE");
                    }),
              ),
              const SizedBox(
                width: 1,
              ),
              Expanded(
                flex: 1,
                child: BaseOption(
                    title: "平均等级",
                    data: leave,
                    btnSelect: () {
                      _openSimpleDialog("LEAVE");
                    }),
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
                  data: materialType,
                  btnSelect: () {
                    _openSimpleDialog("MATERIALTYPE");
                  },
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

  _openSimpleDialog(String tag) async {
    List<String> dataList = [];
    if (tag == "GATE") {
      dataList = BaseData().gateList;
    } else if (tag == "LEAVE") {
      dataList = BaseData().leaveList;
    } else if (tag == "MATERIALTYPE") {
      dataList = BaseData().leaveList;
    }
    final option = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            alignment: Alignment.center,
            backgroundColor: Colors.grey[800],
            titlePadding: EdgeInsets.all(0),
            title: Container(
              height: 30,
              color: Colors.grey[850],
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          margin: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                          child: const Image(
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                            image: AssetImage("static/image/ic_logo.jpg"),
                          ),
                        ),
                        Text(
                          BaseData().title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            children: <Widget>[
              Column(
                children: dataList
                    .map(
                      (e) => SimpleDialogOption(
                        padding: EdgeInsets.all(0),
                        child: Ink(
                          //使用Ink包裹，在这里设置颜色
                          child: InkWell(
                            splashColor: Colors.red,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 90, vertical: 15),
                              child: Text(
                                e,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                if (tag == "GATE") {
                                  gate = e;
                                } else if (tag == "LEAVE") {
                                  leave = e;
                                }
                              });
                              Navigator.pop(context, 1);
                              widget.selectBack(tag, e);
                            },
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          );
        });
  }
}
