import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shootingtrack/data/data.dart';
import 'package:shootingtrack/domain/domain.dart';
import 'package:shootingtrack/presentation/shooting_record_list/bloc/shooting_record_list_state.dart';

class ShootingRecordListCubit extends Cubit<ShootingRecordListState> {
  ShootingRecordListCubit({
    required this.shootingRecordRepository,
  }) : super(const ShootingRecordListState.initial());

  final ShootingRecordsRepository shootingRecordRepository;

  bool isListeningToBox = false;

  Future<void> onInit(Weapon weapon) async {
    emit(const ShootingRecordListState.loading());

    await _loadData(weapon);
  }

  Future<void> refresh(Weapon weapon) async {
    await _loadData(weapon);
  }

  Future<void> _loadData(Weapon weapon) async {
    try {
      var shootingRecords = await shootingRecordRepository.getRecordsForWeapon(weapon);
      if (shootingRecords.isEmpty) {
        emit(const ShootingRecordListState.empty());
      } else {
        emit(ShootingRecordListState.success(
          shootingRecords: shootingRecords.toList(growable: false),
        ));
      }
    }
    catch (e) {
      emit (ShootingRecordListState.error(e));
    }
  }
}