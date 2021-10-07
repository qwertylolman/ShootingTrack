import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shootingtrack/data/data.dart';
import 'package:shootingtrack/presentation/common/base_state.dart';

part 'weapon_list_state.freezed.dart';

@freezed
class WeaponListState with _$WeaponListState implements BaseState {
  const WeaponListState._();

  const factory WeaponListState.initial() = Initial;

  @Implements(LoadingState)
  const factory WeaponListState.loading() = Loading;

  @Implements(ErrorState)
  const factory WeaponListState.error(Object error) = Error;

  @Implements(EmptyState)
  const factory WeaponListState.empty() = Empty;

  @Implements(SuccessFeedState)
  const factory WeaponListState.success({
    required List<Weapon> weapons,
    required Weapon lastWeapon,
  }) = Success;

  List<Object> get items => maybeMap(
      orElse: () => <Object>[],
      success: (Success success) => success.weapons);

  int get itemsCount => maybeMap(
      orElse: () => 0,
      success: (Success success) => success.weapons.length);
}