import 'package:hive/hive.dart';

import 'gauge.dart';
import 'manufacturer.dart';

@HiveType(typeId: 2)
class Weapon {
  @HiveField(0)
  String id;
  @HiveField(1)
  Manufacturer manufacturer;
  @HiveField(2)
  String model;
  @HiveField(3)
  Gauge gauge;

  Weapon({
    required this.id,
    required this.manufacturer,
    required this.model,
    required this.gauge});
}