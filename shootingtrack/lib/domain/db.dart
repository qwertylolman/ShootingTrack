import 'package:hive/hive.dart';
import 'package:shootingtrack/common.dart';
import 'package:uuid/uuid.dart';

class DB {
  static String generateId()
    => const Uuid().v4();

  static Future<Box<T>> box<T>({String boxName = ""}) async {
    boxName = boxName.isEmpty ? Common.defaultBoxName : boxName;
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<T>(boxName);
    }

    var b1 = await boxDynamic();
    return await Hive.openBox<T>(boxName);
  }

  static Future<Box<dynamic>> boxDynamic({String boxName = ""}) async {
    boxName = boxName.isEmpty ? Common.defaultBoxName : boxName;
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box(boxName);
    }

    return await Hive.openBox(boxName);
  }
}