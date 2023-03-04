import 'package:flutter/cupertino.dart';
import 'package:lk_epk/model/switchtag_model.dart';

class SwitchTagContext extends InheritedWidget {
  //数据
  final SwitchTagModel switchTagModel;
  //点击switch的方法
  final Function() switchClient;

  const SwitchTagContext({
    Key? key,
    required this.switchTagModel,
    required this.switchClient,
    required Widget child,
  }) : super(key: key, child: child);

  static SwitchTagContext? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: SwitchTagContext);
  }

  @override
  bool updateShouldNotify(covariant SwitchTagContext oldWidget) {
    // print("${switchTagModel != oldWidget.switchTagModel}1111");
    return switchTagModel != oldWidget.switchTagModel;
  }
}
