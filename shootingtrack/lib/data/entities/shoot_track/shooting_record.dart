import 'package:hive/hive.dart';

import '../../data.dart';

part 'shooting_record.g.dart';

@HiveType(typeId : 5)
class ShootingRecord extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  Weapon weapon;

  ShootingRecord({
    required this.id,
    required this.weapon,
  });
}