import 'package:collection/src/iterable_extensions.dart';
import 'package:shootingtrack/data/entities/model.dart';
import 'package:shootingtrack/domain/db.dart';
import 'package:shootingtrack/domain/repositories/crud_repository.dart';

import '../../common.dart';

class ModelsRepository extends CrudRepository<Model> {
  @override
  String boxName() {
    return "model";
  }

  Future<Model> createManufacturer(
      String name) async {
    var model = Model(id: DB.generateId(), name: name);
    return await create(model.id, model);
  }

  Future<Model?> getByName(
      String name
      ) async {
    var gauges = await readAll();
    return gauges.firstWhereOrNull((i) => equalsIgnoreCase(i.name, name));
  }
}