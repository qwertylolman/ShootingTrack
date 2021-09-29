import 'package:shootingtrack/data/data.dart';
import 'package:shootingtrack/presentation/common/base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weapon_state.freezed.dart';

@freezed
class WeaponState with _$WeaponState implements BaseState {
  const WeaponState._();
  const factory WeaponState.initial() = Initial;
  @Implements(LoadingState)
  const factory WeaponState.loading() = Loading;
  @Implements(ErrorState)
  const factory WeaponState.error(Object error) = Error;
  @Implements(EmptyState)
  const factory WeaponState.empty() = Empty;

  const factory WeaponState.success({
    required Weapon weapon,
    required List<Manufacturer> manufacturers,
    required List<Model> models,
    required List<Gauge> gauges,
  }) = Success;
}