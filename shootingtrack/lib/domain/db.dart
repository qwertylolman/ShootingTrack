import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class DB {
  static const String defaultBoxName = "DefaultBox";

  static String generateId()
    => const Uuid().v4();

  static Future<Box<T>> openBox<T>({String boxName = ""}) {
    boxName = boxName.isEmpty ? defaultBoxName : boxName;

    return Hive.openBox<T>(boxName);
  }

  static Future<Box<dynamic>> openBoxDynamic({String boxName = ""}) {
    boxName = boxName.isEmpty ? defaultBoxName : boxName;

    return Hive.openBox(boxName);
  }
}