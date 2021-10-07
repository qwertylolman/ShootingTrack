import 'package:hive_flutter/hive_flutter.dart';
import 'package:shootingtrack/domain/db.dart';

abstract class CrudRepository<T> {
  String boxName();

  Future<Box<T>> box() {
    return DB.box<T>(boxName());
  }

  Future<T> create(String key, T entity) async {
    await (await box()).put(key, entity);

    return entity;
  }

  Future<Iterable<T>> readAll() async {
    return (await box()).values;
  }

  Future<T?> read(String? id) async {
    if (id == null
      || id.isEmpty) {
      return null;
    }

    return (await box()).get(id);
  }

  Future<T> update(String key, T entity) async {
    if (entity is HiveObject) {
      await entity.save();
    } else {
      await (await box()).put(key, entity);
    }

    return entity;
  }

  Future<void> delete(String key) async {
    await (await box()).delete(key);
  }

  Future<void> deleteItems(Iterable<String> keys) async {
    var b = await box();
    for (var key in keys) {
      await b.delete(key);
    }
  }
}