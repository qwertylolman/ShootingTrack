import 'package:shootingtrack/data/entities/entities.dart';
import 'package:shootingtrack/domain/db.dart';
import 'package:shootingtrack/domain/repositories/crud_repository.dart';

class WeaponsRepository extends CrudRepository<Weapon> {
  @override
  String boxName() {
    return "weapon";
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