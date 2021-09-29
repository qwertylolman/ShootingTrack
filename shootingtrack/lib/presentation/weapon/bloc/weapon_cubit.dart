import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shootingtrack/data/entities/weapon.dart';
import 'package:shootingtrack/domain/db.dart';
import 'package:shootingtrack/domain/repositories/weapons_repository.dart';
import 'package:shootingtrack/presentation/weapon/bloc/weapon_state.dart';
import 'package:uuid/uuid.dart';

class WeaponCubit extends Cubit<WeaponState> {
  WeaponCubit({
    required this.weaponsRepository
  }) : super(const WeaponState.initial());

  final WeaponsRepository weaponsRepository;

  Future<void> onInit(String? weaponId) async {
    emit(const WeaponState.loading());
    var weapon = await weaponsRepository.getWeapon(weaponId);
    if (weapon == null) {
      emit(const WeaponState.empty());
    } else {
      emit(WeaponState.success(weapon: weapon));
    }
  }

  Future<void> createWeapon(String name, String model) async {
    var weapon = Weapon(
      id: DB.generateId(),
      name: name,
      model: model,
      gauge: null,
      manufacturer: nu
    )
  }

  Future<void> updateWeapon(Weapon weapon) async {
    await weaponsRepository.saveWeapon(weapon);
  }
}