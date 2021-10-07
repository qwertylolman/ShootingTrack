import 'package:collection/src/iterable_extensions.dart';
import 'package:shootingtrack/data/entities/entities.dart';
import 'package:shootingtrack/domain/db.dart';
import 'package:shootingtrack/domain/repositories/crud_repository.dart';

import '../../../common.dart';

class ManufacturersRepository extends CrudRepository<Manufacturer> {
  @override
  String boxName() {
    return "manufacturer";
  }

  Future<Manufacturer> createManufacturer(
      String name) async {
    var manufacturer = Manufacturer(id: DB.generateId(), name: name);
    return await create(manufacturer.id, manufacturer);
  }

  Future<Manufacturer?> getByName(
      String name
      ) async {
    var gauges = await readAll();
    return gauges.firstWhereOrNull((i) => equalsIgnoreCase(i.name, name));
  }
}