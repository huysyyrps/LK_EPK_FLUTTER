import 'package:flutter/material.dart';

class BaseDialog {
  // Future<String?> _showSimpleDialog(context) {
  //   var province = ['四川', '重庆', '云南', '贵州', '北京', '上海'];
  //   List<Widget> _createItem() {
  //     var list = <Widget>[];
  //     for (var element in province) {
  //       list.add(SimpleDialogOption(
  //         onPressed: () {
  //           // Navigator.pop(context, element);
  //           print(element);
  //         },
  //         child: Text(
  //           element,
  //           style: const TextStyle(fontSize: 20),
  //         ),
  //         padding: const EdgeInsets.all(10),
  //       ));
  //     }
  //     return list;
  //   }

  //   return showDialog<String>(
  //       context: context,
  //       builder: (context) {
  //         return SimpleDialog(
  //           title: const Text('请选择'),
  //           children: _createItem(),
  //         );
  //       });
  // }

  _showSimpleDialog(BuildContext context) {
    var province = ['四川', '重庆', '云南', '贵州', '北京', '上海'];
    List<Widget> _createItem() {
      var list = <Widget>[];
      for (var element in province) {
        list.add(SimpleDialogOption(
          onPressed: () {
            // Navigator.pop(context, element);
            print(element);
          },
          child: Text(
            element,
            style: const TextStyle(fontSize: 20),
          ),
          padding: const EdgeInsets.all(10),
        ));
      }
      return list;
    }

    return showDialog<String>(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('请选择'),
            children: _createItem(),
          );
        });
  }
}
