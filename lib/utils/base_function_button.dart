import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lk_epk/data/base_data.dart';
import 'package:lk_epk/file/path_provider.dart';
import 'package:lk_epk/pages/home.dart';
import 'package:lk_epk/utils/base_dialogtitle.dart';
import 'package:lk_epk/utils/base_option.dart';

class BaseFunctionButton extends StatefulWidget {
  final Function selectBack;

  const BaseFunctionButton({super.key, required this.selectBack});

  @override
  State<BaseFunctionButton> createState() => _BaseFunctionButtonState();
}

class _BaseFunctionButtonState extends State<BaseFunctionButton> {
  bool _switchTag = false;
  String gate = "自动";
  String leave = "2"; //平均等级
  String materialType = "碳钢"; //材料类型
  String waveType = "射频波"; //检波方式
  String rangeAdd = "1X"; //范围扩展
  String workTemp = "25"; //工作温度
  String audioSpeed = "3254.0"; //声速

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
                              // HomePage().test();
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
                  title: "声速（m/s）",
                  data: audioSpeed,
                  btnSelect: () {},
                ),
              ),
              const SizedBox(
                width: 1,
              ),
              Expanded(
                flex: 1,
                child: BaseOption(
                  title: "范围扩展",
                  data: rangeAdd,
                  btnSelect: () {
                    _openSimpleDialog("RANGEADD");
                  },
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
                  title: "检波方式",
                  data: waveType,
                  btnSelect: () {
                    _openSimpleDialog("WAVETYPE");
                  },
                ),
              ),
              const SizedBox(
                width: 1,
              ),
              Expanded(
                flex: 1,
                child: BaseOption(
                  title: "工作温度",
                  data: workTemp,
                  btnSelect: () {
                    selectTemp(workTemp);
                  },
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
                  btnSelect: () {
                    print("参数初始");
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  selectTemp(String tag) {
    TextEditingController tempCon = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            alignment: Alignment.center,
            backgroundColor: Colors.grey[800],
            titlePadding: const EdgeInsets.all(0),
            title: const BaseDialogTitle(),
            children: <Widget>[
              Column(
                children: [
                  Container(
                    height: 120,
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: TextField(
                      controller: tempCon,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: Colors.yellow[800], letterSpacing: 1.5),
                      decoration: InputDecoration(
                          hintText: "请输入工作温度",
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
                          hintStyle: TextStyle(
                            fontSize: 13,
                            height: 1,
                            color: Colors.yellow[800],
                          )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 30,
                        margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context, 1);
                          },
                          child: const Text("取消"),
                        ),
                      ),
                      Container(
                          height: 30,
                          margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                          child: ElevatedButton(
                              onPressed: () {
                                workTemp = tempCon.text;
                                Navigator.pop(context, 1);
                                widget.selectBack(tag, tempCon.text);
                              },
                              child: const Text("确定")))
                    ],
                  ),
                ],
              )
            ],
          );
        });
  }

  _openSimpleDialog(String tag) async {
    List<String> dataList = [];
    if (tag == "GATE") {
      dataList = BaseData().gateList;
    } else if (tag == "LEAVE") {
      dataList = BaseData().leaveList;
    } else if (tag == "MATERIALTYPE") {
      String saveMaterialType = await BasePathProvider().readString();
      dataList = saveMaterialType.split("++");
    } else if (tag == "RANGEADD") {
      dataList = BaseData().rangeAddList;
    } else if (tag == "WAVETYPE") {
      dataList = BaseData().waveTypeList;
    }

    final option = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            alignment: Alignment.center,
            backgroundColor: Colors.grey[800],
            titlePadding: const EdgeInsets.all(0),
            title: const BaseDialogTitle(),
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
                                } else if (tag == "MATERIALTYPE") {
                                  materialType = e.split(" ")[0];
                                  audioSpeed = e.split(" ")[1];
                                } else if (tag == "RANGEADD") {
                                  rangeAdd = e;
                                } else if (tag == "WAVETYPE") {
                                  waveType = e;
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
