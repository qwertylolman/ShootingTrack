import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shootingtrack/domain/repositories/weapons_repository.dart';
import 'package:shootingtrack/presentation/weapon/bloc/weapon_state.dart';

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
}