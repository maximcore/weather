// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'current_city_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CurrentCityStateTearOff {
  const _$CurrentCityStateTearOff();

  _CurrentCityState call(
      {WeatherEntity? weather,
      List<DayWeatherEntity>? weekWeather,
      List<TodaysWeatherEntity>? todaysWeather,
      required CurrentCityStatus status}) {
    return _CurrentCityState(
      weather: weather,
      weekWeather: weekWeather,
      todaysWeather: todaysWeather,
      status: status,
    );
  }
}

/// @nodoc
const $CurrentCityState = _$CurrentCityStateTearOff();

/// @nodoc
mixin _$CurrentCityState {
// add list of the weather for next 7 days
  WeatherEntity? get weather => throw _privateConstructorUsedError;
  List<DayWeatherEntity>? get weekWeather => throw _privateConstructorUsedError;
  List<TodaysWeatherEntity>? get todaysWeather =>
      throw _privateConstructorUsedError;
  CurrentCityStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentCityStateCopyWith<CurrentCityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentCityStateCopyWith<$Res> {
  factory $CurrentCityStateCopyWith(
          CurrentCityState value, $Res Function(CurrentCityState) then) =
      _$CurrentCityStateCopyWithImpl<$Res>;
  $Res call(
      {WeatherEntity? weather,
      List<DayWeatherEntity>? weekWeather,
      List<TodaysWeatherEntity>? todaysWeather,
      CurrentCityStatus status});
}

/// @nodoc
class _$CurrentCityStateCopyWithImpl<$Res>
    implements $CurrentCityStateCopyWith<$Res> {
  _$CurrentCityStateCopyWithImpl(this._value, this._then);

  final CurrentCityState _value;
  // ignore: unused_field
  final $Res Function(CurrentCityState) _then;

  @override
  $Res call({
    Object? weather = freezed,
    Object? weekWeather = freezed,
    Object? todaysWeather = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      weather: weather == freezed
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as WeatherEntity?,
      weekWeather: weekWeather == freezed
          ? _value.weekWeather
          : weekWeather // ignore: cast_nullable_to_non_nullable
              as List<DayWeatherEntity>?,
      todaysWeather: todaysWeather == freezed
          ? _value.todaysWeather
          : todaysWeather // ignore: cast_nullable_to_non_nullable
              as List<TodaysWeatherEntity>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CurrentCityStatus,
    ));
  }
}

/// @nodoc
abstract class _$CurrentCityStateCopyWith<$Res>
    implements $CurrentCityStateCopyWith<$Res> {
  factory _$CurrentCityStateCopyWith(
          _CurrentCityState value, $Res Function(_CurrentCityState) then) =
      __$CurrentCityStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {WeatherEntity? weather,
      List<DayWeatherEntity>? weekWeather,
      List<TodaysWeatherEntity>? todaysWeather,
      CurrentCityStatus status});
}

/// @nodoc
class __$CurrentCityStateCopyWithImpl<$Res>
    extends _$CurrentCityStateCopyWithImpl<$Res>
    implements _$CurrentCityStateCopyWith<$Res> {
  __$CurrentCityStateCopyWithImpl(
      _CurrentCityState _value, $Res Function(_CurrentCityState) _then)
      : super(_value, (v) => _then(v as _CurrentCityState));

  @override
  _CurrentCityState get _value => super._value as _CurrentCityState;

  @override
  $Res call({
    Object? weather = freezed,
    Object? weekWeather = freezed,
    Object? todaysWeather = freezed,
    Object? status = freezed,
  }) {
    return _then(_CurrentCityState(
      weather: weather == freezed
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as WeatherEntity?,
      weekWeather: weekWeather == freezed
          ? _value.weekWeather
          : weekWeather // ignore: cast_nullable_to_non_nullable
              as List<DayWeatherEntity>?,
      todaysWeather: todaysWeather == freezed
          ? _value.todaysWeather
          : todaysWeather // ignore: cast_nullable_to_non_nullable
              as List<TodaysWeatherEntity>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CurrentCityStatus,
    ));
  }
}

/// @nodoc

class _$_CurrentCityState implements _CurrentCityState {
  _$_CurrentCityState(
      {this.weather,
      this.weekWeather,
      this.todaysWeather,
      required this.status});

  @override // add list of the weather for next 7 days
  final WeatherEntity? weather;
  @override
  final List<DayWeatherEntity>? weekWeather;
  @override
  final List<TodaysWeatherEntity>? todaysWeather;
  @override
  final CurrentCityStatus status;

  @override
  String toString() {
    return 'CurrentCityState(weather: $weather, weekWeather: $weekWeather, todaysWeather: $todaysWeather, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurrentCityState &&
            const DeepCollectionEquality().equals(other.weather, weather) &&
            const DeepCollectionEquality()
                .equals(other.weekWeather, weekWeather) &&
            const DeepCollectionEquality()
                .equals(other.todaysWeather, todaysWeather) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(weather),
      const DeepCollectionEquality().hash(weekWeather),
      const DeepCollectionEquality().hash(todaysWeather),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$CurrentCityStateCopyWith<_CurrentCityState> get copyWith =>
      __$CurrentCityStateCopyWithImpl<_CurrentCityState>(this, _$identity);
}

abstract class _CurrentCityState implements CurrentCityState {
  factory _CurrentCityState(
      {WeatherEntity? weather,
      List<DayWeatherEntity>? weekWeather,
      List<TodaysWeatherEntity>? todaysWeather,
      required CurrentCityStatus status}) = _$_CurrentCityState;

  @override // add list of the weather for next 7 days
  WeatherEntity? get weather;
  @override
  List<DayWeatherEntity>? get weekWeather;
  @override
  List<TodaysWeatherEntity>? get todaysWeather;
  @override
  CurrentCityStatus get status;
  @override
  @JsonKey(ignore: true)
  _$CurrentCityStateCopyWith<_CurrentCityState> get copyWith =>
      throw _privateConstructorUsedError;
}
