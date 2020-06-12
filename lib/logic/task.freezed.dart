// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

class _$TaskTearOff {
  const _$TaskTearOff();

  _Task call(
      {@required String name,
      @required int points,
      @required int uid,
      List<String> parts}) {
    return _Task(
      name: name,
      points: points,
      uid: uid,
      parts: parts,
    );
  }
}

// ignore: unused_element
const $Task = _$TaskTearOff();

mixin _$Task {
  String get name;
  int get points;
  int get uid;
  List<String> get parts;

  Map<String, dynamic> toJson();
  $TaskCopyWith<Task> get copyWith;
}

abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res>;
  $Res call({String name, int points, int uid, List<String> parts});
}

class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  final Task _value;
  // ignore: unused_field
  final $Res Function(Task) _then;

  @override
  $Res call({
    Object name = freezed,
    Object points = freezed,
    Object uid = freezed,
    Object parts = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      points: points == freezed ? _value.points : points as int,
      uid: uid == freezed ? _value.uid : uid as int,
      parts: parts == freezed ? _value.parts : parts as List<String>,
    ));
  }
}

abstract class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) then) =
      __$TaskCopyWithImpl<$Res>;
  @override
  $Res call({String name, int points, int uid, List<String> parts});
}

class __$TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res>
    implements _$TaskCopyWith<$Res> {
  __$TaskCopyWithImpl(_Task _value, $Res Function(_Task) _then)
      : super(_value, (v) => _then(v as _Task));

  @override
  _Task get _value => super._value as _Task;

  @override
  $Res call({
    Object name = freezed,
    Object points = freezed,
    Object uid = freezed,
    Object parts = freezed,
  }) {
    return _then(_Task(
      name: name == freezed ? _value.name : name as String,
      points: points == freezed ? _value.points : points as int,
      uid: uid == freezed ? _value.uid : uid as int,
      parts: parts == freezed ? _value.parts : parts as List<String>,
    ));
  }
}

@JsonSerializable()
class _$_Task extends _Task with DiagnosticableTreeMixin {
  const _$_Task(
      {@required this.name,
      @required this.points,
      @required this.uid,
      this.parts})
      : assert(name != null),
        assert(points != null),
        assert(uid != null),
        super._();

  factory _$_Task.fromJson(Map<String, dynamic> json) =>
      _$_$_TaskFromJson(json);

  @override
  final String name;
  @override
  final int points;
  @override
  final int uid;
  @override
  final List<String> parts;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Task(name: $name, points: $points, uid: $uid, parts: $parts)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Task'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('points', points))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('parts', parts));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Task &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.points, points) ||
                const DeepCollectionEquality().equals(other.points, points)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.parts, parts) ||
                const DeepCollectionEquality().equals(other.parts, parts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(points) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(parts);

  @override
  _$TaskCopyWith<_Task> get copyWith =>
      __$TaskCopyWithImpl<_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TaskToJson(this);
  }
}

abstract class _Task extends Task {
  const _Task._() : super._();
  const factory _Task(
      {@required String name,
      @required int points,
      @required int uid,
      List<String> parts}) = _$_Task;

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  String get name;
  @override
  int get points;
  @override
  int get uid;
  @override
  List<String> get parts;
  @override
  _$TaskCopyWith<_Task> get copyWith;
}
