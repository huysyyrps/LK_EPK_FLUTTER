import 'dart:io';

import 'package:path_provider/path_provider.dart';

class BasePathProvider {
  /// 获取应用程序目录文件
  Future<File> getLocalSupportFile() async {
    final dir = await getApplicationSupportDirectory();
    return File('${dir.path}/materialType.txt');
  }

  /// 读取值
  Future<String> readString() async {
    try {
      final file2 = await getLocalSupportFile();
      final result2 = await file2.readAsString();
      print("result2-----$result2");
      return result2;
    } catch (e) {}
    return "";
  }

  /// 写入数据
  Future<void> writeString(String str) async {
    final file2 = await getLocalSupportFile();
    await file2.writeAsString(str);
    print("写入成功");
  }
}
