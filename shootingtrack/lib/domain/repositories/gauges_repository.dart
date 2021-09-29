import 'package:collection/src/iterable_extensions.dart';
import 'package:shootingtrack/common.dart';
import 'package:shootingtrack/data/entities/entities.dart';
import 'package:shootingtrack/domain/domain.dart';

class GaugesRepository extends CrudRepository<Gauge> {
  @override
  String boxName() {
    return "gauge";
  }

  Future<Gauge> createGauge(
      String name
    ) async {
    var gauge = Gauge(id: DB.generateId(), name: name);
    return await create(gauge.id, gauge);
  }

  Future<Gauge?> getByName(
      String name
  ) async {
    var gauges = await readAll();
    return gauges.firstWhereOrNull((i) => equalsIgnoreCase(i.name, name));
  }
}