import 'package:collection/src/iterable_extensions.dart';
import 'package:shootingtrack/data/entities/entities.dart';
import 'package:shootingtrack/domain/db.dart';
import 'package:shootingtrack/domain/repositories/crud_repository.dart';

import '../../../common.dart';

class ModelsRepository extends CrudRepository<Model> {
  @override
  String boxName() {
    return "model";
  }

  Future<Model> createModel(
      String name,
      Manufacturer manufacturer) async {
    var model = Model(id: DB.generateId(), name: name, manufacturer: manufacturer);
    return await create(model.id, model);
  }

  Future<Model?> getByNameAndManufacturer(
      String name,
      String manufacturerId,
      ) async {
    var gauges = await readAll();
    return gauges.firstWhereOrNull((i) => equalsIgnoreCase(i.name, name) && i.manufacturer.id == manufacturerId);
  }
}