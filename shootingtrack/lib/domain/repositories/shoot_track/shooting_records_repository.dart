import 'package:shootingtrack/data/entities/entities.dart';
import 'package:shootingtrack/domain/domain.dart';

class ShootingRecordsRepository extends CrudRepository<ShootingRecord> {
  @override
  String boxName() {
    return "shooting_record";
  }

  Future<ShootingRecord> createShootingRecord(
      Weapon weapon,
      DateTime timestamp,
      int bulletsFired,
      String description,
      ) async {
    var shootingRecord = ShootingRecord(
        id: DB.generateId(),
        weapon: weapon,
        timestamp: timestamp,
        bulletsFired: bulletsFired,
        description: description);
    return await create(shootingRecord.id, shootingRecord);
  }

  Future<Iterable<ShootingRecord>> getRecordsForWeapon(Weapon weapon) async {
    var allRecords = await readAll();
    var weaponId = weapon.id;

    return allRecords.where((element) => element.weapon.id == weaponId);
  }

  Future<void> deleteRecordsForWeapon(Weapon weapon) async {
    var weaponRecords = await getRecordsForWeapon(weapon);
    await deleteItems(weaponRecords.map((e) => e.id));
  }
}