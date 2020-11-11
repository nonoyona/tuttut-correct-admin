// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'exercise_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ExerciseInfo _$ExerciseInfoFromJson(Map<String, dynamic> json) {
  return _ExerciseInfo.fromJson(json);
}

/// @nodoc
class _$ExerciseInfoTearOff {
  const _$ExerciseInfoTearOff();

// ignore: unused_element
  _ExerciseInfo call(
      {@required String id,
      @required String name,
      @required String userId,
      @required String groupId}) {
    return _ExerciseInfo(
      id: id,
      name: name,
      userId: userId,
      groupId: groupId,
    );
  }

// ignore: unused_element
  ExerciseInfo fromJson(Map<String, Object> json) {
    return ExerciseInfo.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ExerciseInfo = _$ExerciseInfoTearOff();

/// @nodoc
mixin _$ExerciseInfo {
  String get id;
  String get name;
  String get userId;
  String get groupId;

  Map<String, dynamic> toJson();
  $ExerciseInfoCopyWith<ExerciseInfo> get copyWith;
}

/// @nodoc
abstract class $ExerciseInfoCopyWith<$Res> {
  factory $ExerciseInfoCopyWith(
          ExerciseInfo value, $Res Function(ExerciseInfo) then) =
      _$ExerciseInfoCopyWithImpl<$Res>;
  $Res call({String id, String name, String userId, String groupId});
}

/// @nodoc
class _$ExerciseInfoCopyWithImpl<$Res> implements $ExerciseInfoCopyWith<$Res> {
  _$ExerciseInfoCopyWithImpl(this._value, this._then);

  final ExerciseInfo _value;
  // ignore: unused_field
  final $Res Function(ExerciseInfo) _then;

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
abstract class _$ExerciseInfoCopyWith<$Res>
    implements $ExerciseInfoCopyWith<$Res> {
  factory _$ExerciseInfoCopyWith(
          _ExerciseInfo value, $Res Function(_ExerciseInfo) then) =
      __$ExerciseInfoCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, String userId, String groupId});
}

/// @nodoc
class __$ExerciseInfoCopyWithImpl<$Res> extends _$ExerciseInfoCopyWithImpl<$Res>
    implements _$ExerciseInfoCopyWith<$Res> {
  __$ExerciseInfoCopyWithImpl(
      _ExerciseInfo _value, $Res Function(_ExerciseInfo) _then)
      : super(_value, (v) => _then(v as _ExerciseInfo));

  @override
  _ExerciseInfo get _value => super._value as _ExerciseInfo;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object userId = freezed,
    Object groupId = freezed,
  }) {
    return _then(_ExerciseInfo(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      userId: userId == freezed ? _value.userId : userId as String,
      groupId: groupId == freezed ? _value.groupId : groupId as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ExerciseInfo extends _ExerciseInfo with DiagnosticableTreeMixin {
  const _$_ExerciseInfo(
      {@required this.id,
      @required this.name,
      @required this.userId,
      @required this.groupId})
      : assert(id != null),
        assert(name != null),
        assert(userId != null),
        assert(groupId != null),
        super._();

  factory _$_ExerciseInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_ExerciseInfoFromJson(json);

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
    return 'ExerciseInfo(id: $id, name: $name, userId: $userId, groupId: $groupId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExerciseInfo'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('groupId', groupId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ExerciseInfo &&
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
  _$ExerciseInfoCopyWith<_ExerciseInfo> get copyWith =>
      __$ExerciseInfoCopyWithImpl<_ExerciseInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ExerciseInfoToJson(this);
  }
}

abstract class _ExerciseInfo extends ExerciseInfo {
  const _ExerciseInfo._() : super._();
  const factory _ExerciseInfo(
      {@required String id,
      @required String name,
      @required String userId,
      @required String groupId}) = _$_ExerciseInfo;

  factory _ExerciseInfo.fromJson(Map<String, dynamic> json) =
      _$_ExerciseInfo.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get userId;
  @override
  String get groupId;
  @override
  _$ExerciseInfoCopyWith<_ExerciseInfo> get copyWith;
}
