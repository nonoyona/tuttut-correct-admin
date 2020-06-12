// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'student.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Student _$StudentFromJson(Map<String, dynamic> json) {
  return _Student.fromJson(json);
}

class _$StudentTearOff {
  const _$StudentTearOff();

  _Student call(
      String name, String groupName, List<String> votingPoints, String id) {
    return _Student(
      name,
      groupName,
      votingPoints,
      id,
    );
  }
}

// ignore: unused_element
const $Student = _$StudentTearOff();

mixin _$Student {
  String get name;
  String get groupName;
  List<String> get votingPoints;
  String get id;

  Map<String, dynamic> toJson();
  $StudentCopyWith<Student> get copyWith;
}

abstract class $StudentCopyWith<$Res> {
  factory $StudentCopyWith(Student value, $Res Function(Student) then) =
      _$StudentCopyWithImpl<$Res>;
  $Res call(
      {String name, String groupName, List<String> votingPoints, String id});
}

class _$StudentCopyWithImpl<$Res> implements $StudentCopyWith<$Res> {
  _$StudentCopyWithImpl(this._value, this._then);

  final Student _value;
  // ignore: unused_field
  final $Res Function(Student) _then;

  @override
  $Res call({
    Object name = freezed,
    Object groupName = freezed,
    Object votingPoints = freezed,
    Object id = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      groupName: groupName == freezed ? _value.groupName : groupName as String,
      votingPoints: votingPoints == freezed
          ? _value.votingPoints
          : votingPoints as List<String>,
      id: id == freezed ? _value.id : id as String,
    ));
  }
}

abstract class _$StudentCopyWith<$Res> implements $StudentCopyWith<$Res> {
  factory _$StudentCopyWith(_Student value, $Res Function(_Student) then) =
      __$StudentCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name, String groupName, List<String> votingPoints, String id});
}

class __$StudentCopyWithImpl<$Res> extends _$StudentCopyWithImpl<$Res>
    implements _$StudentCopyWith<$Res> {
  __$StudentCopyWithImpl(_Student _value, $Res Function(_Student) _then)
      : super(_value, (v) => _then(v as _Student));

  @override
  _Student get _value => super._value as _Student;

  @override
  $Res call({
    Object name = freezed,
    Object groupName = freezed,
    Object votingPoints = freezed,
    Object id = freezed,
  }) {
    return _then(_Student(
      name == freezed ? _value.name : name as String,
      groupName == freezed ? _value.groupName : groupName as String,
      votingPoints == freezed
          ? _value.votingPoints
          : votingPoints as List<String>,
      id == freezed ? _value.id : id as String,
    ));
  }
}

@JsonSerializable()
class _$_Student extends _Student with DiagnosticableTreeMixin {
  const _$_Student(this.name, this.groupName, this.votingPoints, this.id)
      : assert(name != null),
        assert(groupName != null),
        assert(votingPoints != null),
        assert(id != null),
        super._();

  factory _$_Student.fromJson(Map<String, dynamic> json) =>
      _$_$_StudentFromJson(json);

  @override
  final String name;
  @override
  final String groupName;
  @override
  final List<String> votingPoints;
  @override
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Student(name: $name, groupName: $groupName, votingPoints: $votingPoints, id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Student'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('groupName', groupName))
      ..add(DiagnosticsProperty('votingPoints', votingPoints))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Student &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.groupName, groupName) ||
                const DeepCollectionEquality()
                    .equals(other.groupName, groupName)) &&
            (identical(other.votingPoints, votingPoints) ||
                const DeepCollectionEquality()
                    .equals(other.votingPoints, votingPoints)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(groupName) ^
      const DeepCollectionEquality().hash(votingPoints) ^
      const DeepCollectionEquality().hash(id);

  @override
  _$StudentCopyWith<_Student> get copyWith =>
      __$StudentCopyWithImpl<_Student>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StudentToJson(this);
  }
}

abstract class _Student extends Student {
  const _Student._() : super._();
  const factory _Student(
          String name, String groupName, List<String> votingPoints, String id) =
      _$_Student;

  factory _Student.fromJson(Map<String, dynamic> json) = _$_Student.fromJson;

  @override
  String get name;
  @override
  String get groupName;
  @override
  List<String> get votingPoints;
  @override
  String get id;
  @override
  _$StudentCopyWith<_Student> get copyWith;
}
