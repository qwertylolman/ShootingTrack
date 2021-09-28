import 'package:shootingtrack/data/entities/gauge.dart';
import 'package:shootingtrack/domain/db.dart';

class GaugesRepository {
  Future<Iterable<Gauge>> getAllWeapons() async {
    var box = await DB.openBox<Gauge>();

    return box.values;
  }
}