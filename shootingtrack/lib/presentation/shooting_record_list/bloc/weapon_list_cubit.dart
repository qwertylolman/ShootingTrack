import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shootingtrack/domain/domain.dart';
import 'package:shootingtrack/presentation/weapon_list/bloc/weapon_list_state.dart';

class WeaponListCubit extends Cubit<WeaponListState> {
  WeaponListCubit({
    required this.weaponsRepository,
  }) : super(const WeaponListState.initial());

  final WeaponsRepository weaponsRepository;

  bool isListeningToBox = false;

  Future<void> onInit() async {
    emit(const WeaponListState.loading());

    await _loadData();

    if (!isListeningToBox) {
      var box = await weaponsRepository.box();
      box.watch().listen((event) async {
        await refresh();
      });
      isListeningToBox = true;
    }
  }

  Future<void> refresh() async {
    await _loadData();
  }

  Future<void> _loadData() async {
    try {
      var weapons = await weaponsRepository.readAll();
      if (weapons.isEmpty) {
        emit(const WeaponListState.empty());
      } else {
        emit(WeaponListState.success(
          weapons: weapons.toList(growable: false),
        ));
      }
    }
    catch (e) {
      emit (WeaponListState.error(e));
    }
  }
}