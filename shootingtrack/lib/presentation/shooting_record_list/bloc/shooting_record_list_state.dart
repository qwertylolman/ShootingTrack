import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shootingtrack/data/data.dart';
import 'package:shootingtrack/presentation/common/base_state.dart';

part 'shooting_record_list_state.freezed.dart';

@freezed
class ShootingRecordListState with _$ShootingRecordListState implements BaseState {
  const ShootingRecordListState._();

  const factory ShootingRecordListState.initial() = Initial;

  @Implements(LoadingState)
  const factory ShootingRecordListState.loading() = Loading;

  @Implements(ErrorState)
  const factory ShootingRecordListState.error(Object error) = Error;

  @Implements(EmptyState)
  const factory ShootingRecordListState.empty() = Empty;

  @Implements(SuccessFeedState)
  const factory ShootingRecordListState.success({
    required List<ShootingRecord> shootingRecords,
  }) = Success;

  List<Object> get items => maybeMap(
      orElse: () => <Object>[],
      success: (Success success) => success.shootingRecords);

  int get itemsCount => maybeMap(
      orElse: () => 0,
      success: (Success success) => success.shootingRecords.length);
}