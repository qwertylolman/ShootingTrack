import 'package:hive/hive.dart';

import '../../data.dart';

part 'shooting_record.g.dart';

@HiveType(typeId : 5)
class ShootingRecord extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  Weapon weapon;
  @HiveField(2)
  DateTime timestamp;
  @HiveField(3)
  int bulletsFired;
  @HiveField(4)
  String description;

  ShootingRecord({
    required this.id,
    required this.weapon,
    required this.timestamp,
    required this.bulletsFired,
    required this.description,
  });
}