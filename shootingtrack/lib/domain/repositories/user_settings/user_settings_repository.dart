import 'package:shootingtrack/data/entities/entities.dart';
import 'package:shootingtrack/domain/domain.dart';

class UserSettingsRepository extends CrudRepository<UserSettings> {
  static const String defaultUserId = "DefaultUserId";

  @override
  String boxName() {
    return "user_settings";
  }

  Future<UserSettings> createUserSettingsIfRequired(
      String name
      ) async {
    var userSetting = await read(defaultUserId);
    if (userSetting == null) {
      userSetting = UserSettings(
          id: defaultUserId,
          lastUsedForShooingTrackWeapon: null);

      userSetting = await create(userSetting.id, userSetting);
    }

    return userSetting;
  }
}