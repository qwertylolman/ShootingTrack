import 'package:collection/src/iterable_extensions.dart';
import 'package:shootingtrack/data/entities/weapon.dart';
import 'package:shootingtrack/domain/db.dart';

class WeaponsRepository {
  Future<Iterable<Weapon>> getAllWeapons() async {
    var box = await DB.openBox<Weapon>();

    return box.values;
  }

  Future<Weapon?> getWeapon(String? id) async {
    if (id?.isEmpty != true) {
      return null;
    }

    var allWeapons = await getAllWeapons();
    return allWeapons.firstWhereOrNull((element) => element.id == id);
  }
}