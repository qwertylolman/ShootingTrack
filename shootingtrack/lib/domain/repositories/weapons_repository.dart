import 'package:shootingtrack/data/entities/gauge.dart';
import 'package:shootingtrack/data/entities/manufacturer.dart';
import 'package:shootingtrack/data/entities/model.dart';
import 'package:shootingtrack/data/entities/weapon.dart';
import 'package:shootingtrack/domain/db.dart';
import 'package:shootingtrack/domain/repositories/crud_repository.dart';

class WeaponsRepository extends CrudRepository<Weapon> {
  Future<Iterable<Weapon>> getAllWeapons() async {
    var box = await DB.box<Weapon>();

    return box.values;
  }

  Future<Weapon> createWeapon(
      String name,
      Manufacturer manufacturer,
      Model model,
      Gauge gauge) async {
    var weapon = Weapon(id: DB.generateId(), name: name, manufacturer: manufacturer, model: model, gauge: gauge);
    return await create(weapon.id, weapon);
  }
}