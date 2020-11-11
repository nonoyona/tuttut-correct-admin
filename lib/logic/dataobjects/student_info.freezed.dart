// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'student_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
StudentInfo _$StudentInfoFromJson(Map<String, dynamic> json) {
  return _StudentInfo.fromJson(json);
}

/// @nodoc
class _$StudentInfoTearOff {
  const _$StudentInfoTearOff();

// ignore: unused_element
  _StudentInfo call(
      {@required String id,
      @required String name,
      @required String userId,
      @required String groupId}) {
    return _StudentInfo(
      id: id,
      name: name,
      userId: userId,
      groupId: groupId,
    );
  }

// ignore: unused_element
  StudentInfo fromJson(Map<String, Object> json) {
    return StudentInfo.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $StudentInfo = _$StudentInfoTearOff();

/// @nodoc
mixin _$StudentInfo {
  String get id;
  String get name;
  String get userId;
  String get groupId;

  Map<String, dynamic> toJson();
  $StudentInfoCopyWith<StudentInfo> get copyWith;
}

/// @nodoc
abstract class $StudentInfoCopyWith<$Res> {
  factory $StudentInfoCopyWith(
          StudentInfo value, $Res Function(StudentInfo) then) =
      _$StudentInfoCopyWithImpl<$Res>;
  $Res call({String id, String name, String userId, String groupId});
}

/// @nodoc
class _$StudentInfoCopyWithImpl<$Res> implements $StudentInfoCopyWith<$Res> {
  _$StudentInfoCopyWithImpl(this._value, this._then);

  final StudentInfo _value;
  // ignore: unused_field
  final $Res Function(StudentInfo) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object userId = freezed,
    Object groupId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      userId: userId == freezed ? _value.userId : userId as String,
      groupId: groupId == freezed ? _value.groupId : groupId as String,
    ));
  }
}

/// @nodoc
abstract class _$StudentInfoCopyWith<$Res>
    implements $StudentInfoCopyWith<$Res> {
  factory _$StudentInfoCopyWith(
          _StudentInfo value, $Res Function(_StudentInfo) then) =
      __$StudentInfoCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, String userId, String groupId});
}

/// @nodoc
class __$StudentInfoCopyWithImpl<$Res> extends _$StudentInfoCopyWithImpl<$Res>
    implements _$StudentInfoCopyWith<$Res> {
  __$StudentInfoCopyWithImpl(
      _StudentInfo _value, $Res Function(_StudentInfo) _then)
      : super(_value, (v) => _then(v as _StudentInfo));

  @override
  _StudentInfo get _value => super._value as _StudentInfo;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object userId = freezed,
    Object groupId = freezed,
  }) {
    return _then(_StudentInfo(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      userId: userId == freezed ? _value.userId : userId as String,
      groupId: groupId == freezed ? _value.groupId : groupId as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_StudentInfo extends _StudentInfo with DiagnosticableTreeMixin {
  const _$_StudentInfo(
      {@required this.id,
      @required this.name,
      @required this.userId,
      @required this.groupId})
      : assert(id != null),
        assert(name != null),
        assert(userId != null),
        assert(groupId != null),
        super._();

  factory _$_StudentInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_StudentInfoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String userId;
  @override
  final String groupId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StudentInfo(id: $id, name: $name, userId: $userId, groupId: $groupId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StudentInfo'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('groupId', groupId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StudentInfo &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.groupId, groupId) ||
                const DeepCollectionEquality().equals(other.groupId, groupId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(groupId);

  @override
  _$StudentInfoCopyWith<_StudentInfo> get copyWith =>
      __$StudentInfoCopyWithImpl<_StudentInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StudentInfoToJson(this);
  }
}

abstract class _StudentInfo extends StudentInfo {
  const _StudentInfo._() : super._();
  const factory _StudentInfo(
      {@required String id,
      @required String name,
      @required String userId,
      @required String groupId}) = _$_StudentInfo;

  factory _StudentInfo.fromJson(Map<String, dynamic> json) =
      _$_StudentInfo.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get userId;
  @override
  String get groupId;
  @override
  _$StudentInfoCopyWith<_StudentInfo> get copyWith;
}
