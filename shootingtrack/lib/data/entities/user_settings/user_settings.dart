import 'package:hive/hive.dart';

import '../../data.dart';

part 'user_settings.g.dart';

@HiveType(typeId : 6)
class UserSettings extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  Weapon? lastUsedForShooingTrackWeapon;

  UserSettings({
    required this.id,
    required this.lastUsedForShooingTrackWeapon,
  });
}