import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class DB {
  static const String defaultBoxName = "DefaultBox";

  static String generateId()
    => const Uuid().v4();

  static Future<Box<T>> openBox<T>({String boxName = ""}) async {
    boxName = boxName.isEmpty ? defaultBoxName : boxName;
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<T>(boxName);
    }

    return await Hive.openBox<T>(boxName);
  }

  static Future<Box<dynamic>> openBoxDynamic({String boxName = ""}) async {
    boxName = boxName.isEmpty ? defaultBoxName : boxName;
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box(boxName);
    }

    return await Hive.openBox(boxName);
  }
}