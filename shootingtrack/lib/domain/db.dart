import 'package:hive/hive.dart';

class DB {
  static const String defaultBoxName = "DefaultBox";

  static Future<Box<T>> openBox<T>({String boxName = ""}) {
    boxName = boxName.isEmpty ? defaultBoxName : boxName;

    return Hive.openBox<T>(boxName);
  }

  static Future<Box<dynamic>> openBoxDynamic({String boxName = ""}) {
    boxName = boxName.isEmpty ? defaultBoxName : boxName;

    return Hive.openBox(boxName);
  }
}