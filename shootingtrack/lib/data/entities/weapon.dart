import 'package:hive/hive.dart';

import 'entities.dart';

part 'weapon.g.dart';

@HiveType(typeId : 0)
class Weapon extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  Manufacturer manufacturer;
  @HiveField(3)
  Model model;
  @HiveField(4)
  Gauge gauge;

  Weapon({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.model,
    required this.gauge,
    });
}