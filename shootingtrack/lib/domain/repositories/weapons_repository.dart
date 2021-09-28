import 'package:shootingtrack/data/entities/weapon.dart';
import 'package:shootingtrack/domain/db.dart';

class WeaponsRepository {
  Future<Iterable<Weapon>> getAllWeapons() async {
    var box = await DB.openBox<Weapon>();

    return box.values;
  }
}