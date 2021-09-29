import 'package:hive_flutter/hive_flutter.dart';
import 'package:shootingtrack/domain/db.dart';

class CrudRepository<T> {
  Future<Box<T>> box() {
    return DB.openBox<T>();
  }

  Future<T> create(String key, T entity) async {
    (await box()).put(key, entity);

    return entity;
  }

  Future<Iterable<T>> readAll() async {
    return (await box()).values;
  }

  Future<T?> read(String? id) async {
    if (id?.isEmpty != true) {
      return null;
    }

    return (await box()).get(id);
  }

  Future<T> update(String key, T entity) async {
    if (entity is HiveObject) {
      entity.save();
    } else {
      (await box()).put(key, entity);
    }

    return entity;
  }

  Future<void> delete(String key) async {
    (await box()).delete(key);
  }
}