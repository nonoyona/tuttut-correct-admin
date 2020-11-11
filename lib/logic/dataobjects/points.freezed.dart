// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'points.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Points _$PointsFromJson(Map<String, dynamic> json) {
  return _Points.fromJson(json);
}

/// @nodoc
class _$PointsTearOff {
  const _$PointsTearOff();

// ignore: unused_element
  _Points call({@required int reached, int reachable}) {
    return _Points(
      reached: reached,
      reachable: reachable,
    );
  }

// ignore: unused_element
  Points fromJson(Map<String, Object> json) {
    return Points.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Points = _$PointsTearOff();

/// @nodoc
mixin _$Points {
  int get reached;
  int get reachable;

  Map<String, dynamic> toJson();
  $PointsCopyWith<Points> get copyWith;
}

/// @nodoc
abstract class $PointsCopyWith<$Res> {
  factory $PointsCopyWith(Points value, $Res Function(Points) then) =
      _$PointsCopyWithImpl<$Res>;
  $Res call({int reached, int reachable});
}

/// @nodoc
class _$PointsCopyWithImpl<$Res> implements $PointsCopyWith<$Res> {
  _$PointsCopyWithImpl(this._value, this._then);

  final Points _value;
  // ignore: unused_field
  final $Res Function(Points) _then;

  @override
  $Res call({
    Object reached = freezed,
    Object reachable = freezed,
  }) {
    return _then(_value.copyWith(
      reached: reached == freezed ? _value.reached : reached as int,
      reachable: reachable == freezed ? _value.reachable : reachable as int,
    ));
  }
}

/// @nodoc
abstract class _$PointsCopyWith<$Res> implements $PointsCopyWith<$Res> {
  factory _$PointsCopyWith(_Points value, $Res Function(_Points) then) =
      __$PointsCopyWithImpl<$Res>;
  @override
  $Res call({int reached, int reachable});
}

/// @nodoc
class __$PointsCopyWithImpl<$Res> extends _$PointsCopyWithImpl<$Res>
    implements _$PointsCopyWith<$Res> {
  __$PointsCopyWithImpl(_Points _value, $Res Function(_Points) _then)
      : super(_value, (v) => _then(v as _Points));

  @override
  _Points get _value => super._value as _Points;

  @override
  $Res call({
    Object reached = freezed,
    Object reachable = freezed,
  }) {
    return _then(_Points(
      reached: reached == freezed ? _value.reached : reached as int,
      reachable: reachable == freezed ? _value.reachable : reachable as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Points extends _Points with DiagnosticableTreeMixin {
  const _$_Points({@required this.reached, this.reachable})
      : assert(reached != null),
        super._();

  factory _$_Points.fromJson(Map<String, dynamic> json) =>
      _$_$_PointsFromJson(json);

  @override
  final int reached;
  @override
  final int reachable;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Points(reached: $reached, reachable: $reachable)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Points'))
      ..add(DiagnosticsProperty('reached', reached))
      ..add(DiagnosticsProperty('reachable', reachable));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Points &&
            (identical(other.reached, reached) ||
                const DeepCollectionEquality()
                    .equals(other.reached, reached)) &&
            (identical(other.reachable, reachable) ||
                const DeepCollectionEquality()
                    .equals(other.reachable, reachable)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(reached) ^
      const DeepCollectionEquality().hash(reachable);

  @override
  _$PointsCopyWith<_Points> get copyWith =>
      __$PointsCopyWithImpl<_Points>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PointsToJson(this);
  }
}

abstract class _Points extends Points {
  const _Points._() : super._();
  const factory _Points({@required int reached, int reachable}) = _$_Points;

  factory _Points.fromJson(Map<String, dynamic> json) = _$_Points.fromJson;

  @override
  int get reached;
  @override
  int get reachable;
  @override
  _$PointsCopyWith<_Points> get copyWith;
}
