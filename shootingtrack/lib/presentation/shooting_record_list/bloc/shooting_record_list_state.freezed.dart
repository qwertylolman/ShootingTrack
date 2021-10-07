// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shooting_record_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ShootingRecordListStateTearOff {
  const _$ShootingRecordListStateTearOff();

  Initial initial() {
    return const Initial();
  }

  Loading loading() {
    return const Loading();
  }

  Error error(Object error) {
    return Error(
      error,
    );
  }

  Empty empty() {
    return const Empty();
  }

  Success success({required List<ShootingRecord> shootingRecords}) {
    return Success(
      shootingRecords: shootingRecords,
    );
  }
}

/// @nodoc
const $ShootingRecordListState = _$ShootingRecordListStateTearOff();

/// @nodoc
mixin _$ShootingRecordListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() empty,
    required TResult Function(List<ShootingRecord> shootingRecords) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? empty,
    TResult Function(List<ShootingRecord> shootingRecords)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? empty,
    TResult Function(List<ShootingRecord> shootingRecords)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Empty value) empty,
    required TResult Function(Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Empty value)? empty,
    TResult Function(Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Empty value)? empty,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShootingRecordListStateCopyWith<$Res> {
  factory $ShootingRecordListStateCopyWith(ShootingRecordListState value,
          $Res Function(ShootingRecordListState) then) =
      _$ShootingRecordListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShootingRecordListStateCopyWithImpl<$Res>
    implements $ShootingRecordListStateCopyWith<$Res> {
  _$ShootingRecordListStateCopyWithImpl(this._value, this._then);

  final ShootingRecordListState _value;
  // ignore: unused_field
  final $Res Function(ShootingRecordListState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res>
    extends _$ShootingRecordListStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc

class _$Initial extends Initial {
  const _$Initial() : super._();

  @override
  String toString() {
    return 'ShootingRecordListState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() empty,
    required TResult Function(List<ShootingRecord> shootingRecords) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? empty,
    TResult Function(List<ShootingRecord> shootingRecords)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? empty,
    TResult Function(List<ShootingRecord> shootingRecords)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Empty value) empty,
    required TResult Function(Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Empty value)? empty,
    TResult Function(Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Empty value)? empty,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial extends ShootingRecordListState {
  const factory Initial() = _$Initial;
  const Initial._() : super._();
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res>
    extends _$ShootingRecordListStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

/// @nodoc

@Implements(LoadingState)
class _$Loading extends Loading {
  const _$Loading() : super._();

  @override
  String toString() {
    return 'ShootingRecordListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() empty,
    required TResult Function(List<ShootingRecord> shootingRecords) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? empty,
    TResult Function(List<ShootingRecord> shootingRecords)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? empty,
    TResult Function(List<ShootingRecord> shootingRecords)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Empty value) empty,
    required TResult Function(Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Empty value)? empty,
    TResult Function(Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Empty value)? empty,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading extends ShootingRecordListState implements LoadingState {
  const factory Loading() = _$Loading;
  const Loading._() : super._();
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({Object error});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    extends _$ShootingRecordListStateCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(Error(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Object,
    ));
  }
}

/// @nodoc

@Implements(ErrorState)
class _$Error extends Error {
  const _$Error(this.error) : super._();

  @override
  final Object error;

  @override
  String toString() {
    return 'ShootingRecordListState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Error &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() empty,
    required TResult Function(List<ShootingRecord> shootingRecords) success,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? empty,
    TResult Function(List<ShootingRecord> shootingRecords)? success,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? empty,
    TResult Function(List<ShootingRecord> shootingRecords)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Empty value) empty,
    required TResult Function(Success value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Empty value)? empty,
    TResult Function(Success value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Empty value)? empty,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error extends ShootingRecordListState implements ErrorState {
  const factory Error(Object error) = _$Error;
  const Error._() : super._();

  Object get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorCopyWith<Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmptyCopyWith<$Res> {
  factory $EmptyCopyWith(Empty value, $Res Function(Empty) then) =
      _$EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmptyCopyWithImpl<$Res>
    extends _$ShootingRecordListStateCopyWithImpl<$Res>
    implements $EmptyCopyWith<$Res> {
  _$EmptyCopyWithImpl(Empty _value, $Res Function(Empty) _then)
      : super(_value, (v) => _then(v as Empty));

  @override
  Empty get _value => super._value as Empty;
}

/// @nodoc

@Implements(EmptyState)
class _$Empty extends Empty {
  const _$Empty() : super._();

  @override
  String toString() {
    return 'ShootingRecordListState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() empty,
    required TResult Function(List<ShootingRecord> shootingRecords) success,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? empty,
    TResult Function(List<ShootingRecord> shootingRecords)? success,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? empty,
    TResult Function(List<ShootingRecord> shootingRecords)? success,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Empty value) empty,
    required TResult Function(Success value) success,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Empty value)? empty,
    TResult Function(Success value)? success,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Empty value)? empty,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty extends ShootingRecordListState implements EmptyState {
  const factory Empty() = _$Empty;
  const Empty._() : super._();
}

/// @nodoc
abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
  $Res call({List<ShootingRecord> shootingRecords});
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res>
    extends _$ShootingRecordListStateCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;

  @override
  $Res call({
    Object? shootingRecords = freezed,
  }) {
    return _then(Success(
      shootingRecords: shootingRecords == freezed
          ? _value.shootingRecords
          : shootingRecords // ignore: cast_nullable_to_non_nullable
              as List<ShootingRecord>,
    ));
  }
}

/// @nodoc

@Implements(SuccessFeedState)
class _$Success extends Success {
  const _$Success({required this.shootingRecords}) : super._();

  @override
  final List<ShootingRecord> shootingRecords;

  @override
  String toString() {
    return 'ShootingRecordListState.success(shootingRecords: $shootingRecords)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success &&
            (identical(other.shootingRecords, shootingRecords) ||
                const DeepCollectionEquality()
                    .equals(other.shootingRecords, shootingRecords)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(shootingRecords);

  @JsonKey(ignore: true)
  @override
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() empty,
    required TResult Function(List<ShootingRecord> shootingRecords) success,
  }) {
    return success(shootingRecords);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? empty,
    TResult Function(List<ShootingRecord> shootingRecords)? success,
  }) {
    return success?.call(shootingRecords);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? empty,
    TResult Function(List<ShootingRecord> shootingRecords)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(shootingRecords);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Empty value) empty,
    required TResult Function(Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Empty value)? empty,
    TResult Function(Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Empty value)? empty,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success extends ShootingRecordListState
    implements SuccessFeedState {
  const factory Success({required List<ShootingRecord> shootingRecords}) =
      _$Success;
  const Success._() : super._();

  List<ShootingRecord> get shootingRecords =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuccessCopyWith<Success> get copyWith => throw _privateConstructorUsedError;
}
