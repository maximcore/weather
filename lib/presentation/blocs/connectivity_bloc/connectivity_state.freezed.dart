// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'connectivity_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ConnectivityStateTearOff {
  const _$ConnectivityStateTearOff();

  _ConnectivityState call({required ConnectivityStatus status}) {
    return _ConnectivityState(
      status: status,
    );
  }
}

/// @nodoc
const $ConnectivityState = _$ConnectivityStateTearOff();

/// @nodoc
mixin _$ConnectivityState {
  ConnectivityStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectivityStateCopyWith<ConnectivityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectivityStateCopyWith<$Res> {
  factory $ConnectivityStateCopyWith(
          ConnectivityState value, $Res Function(ConnectivityState) then) =
      _$ConnectivityStateCopyWithImpl<$Res>;
  $Res call({ConnectivityStatus status});
}

/// @nodoc
class _$ConnectivityStateCopyWithImpl<$Res>
    implements $ConnectivityStateCopyWith<$Res> {
  _$ConnectivityStateCopyWithImpl(this._value, this._then);

  final ConnectivityState _value;
  // ignore: unused_field
  final $Res Function(ConnectivityState) _then;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectivityStatus,
    ));
  }
}

/// @nodoc
abstract class _$ConnectivityStateCopyWith<$Res>
    implements $ConnectivityStateCopyWith<$Res> {
  factory _$ConnectivityStateCopyWith(
          _ConnectivityState value, $Res Function(_ConnectivityState) then) =
      __$ConnectivityStateCopyWithImpl<$Res>;
  @override
  $Res call({ConnectivityStatus status});
}

/// @nodoc
class __$ConnectivityStateCopyWithImpl<$Res>
    extends _$ConnectivityStateCopyWithImpl<$Res>
    implements _$ConnectivityStateCopyWith<$Res> {
  __$ConnectivityStateCopyWithImpl(
      _ConnectivityState _value, $Res Function(_ConnectivityState) _then)
      : super(_value, (v) => _then(v as _ConnectivityState));

  @override
  _ConnectivityState get _value => super._value as _ConnectivityState;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_ConnectivityState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectivityStatus,
    ));
  }
}

/// @nodoc

class _$_ConnectivityState implements _ConnectivityState {
  _$_ConnectivityState({required this.status});

  @override
  final ConnectivityStatus status;

  @override
  String toString() {
    return 'ConnectivityState(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ConnectivityState &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$ConnectivityStateCopyWith<_ConnectivityState> get copyWith =>
      __$ConnectivityStateCopyWithImpl<_ConnectivityState>(this, _$identity);
}

abstract class _ConnectivityState implements ConnectivityState {
  factory _ConnectivityState({required ConnectivityStatus status}) =
      _$_ConnectivityState;

  @override
  ConnectivityStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ConnectivityStateCopyWith<_ConnectivityState> get copyWith =>
      throw _privateConstructorUsedError;
}
