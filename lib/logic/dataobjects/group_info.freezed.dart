// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'group_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GroupInfo _$GroupInfoFromJson(Map<String, dynamic> json) {
  return _GroupInfo.fromJson(json);
}

/// @nodoc
class _$GroupInfoTearOff {
  const _$GroupInfoTearOff();

// ignore: unused_element
  _GroupInfo call(
      {@required String name, @required String id, @required String userId}) {
    return _GroupInfo(
      name: name,
      id: id,
      userId: userId,
    );
  }

// ignore: unused_element
  GroupInfo fromJson(Map<String, Object> json) {
    return GroupInfo.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GroupInfo = _$GroupInfoTearOff();

/// @nodoc
mixin _$GroupInfo {
  String get name;
  String get id;
  String get userId;

  Map<String, dynamic> toJson();
  $GroupInfoCopyWith<GroupInfo> get copyWith;
}

/// @nodoc
abstract class $GroupInfoCopyWith<$Res> {
  factory $GroupInfoCopyWith(GroupInfo value, $Res Function(GroupInfo) then) =
      _$GroupInfoCopyWithImpl<$Res>;
  $Res call({String name, String id, String userId});
}

/// @nodoc
class _$GroupInfoCopyWithImpl<$Res> implements $GroupInfoCopyWith<$Res> {
  _$GroupInfoCopyWithImpl(this._value, this._then);

  final GroupInfo _value;
  // ignore: unused_field
  final $Res Function(GroupInfo) _then;

  @override
  $Res call({
    Object name = freezed,
    Object id = freezed,
    Object userId = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      id: id == freezed ? _value.id : id as String,
      userId: userId == freezed ? _value.userId : userId as String,
    ));
  }
}

/// @nodoc
abstract class _$GroupInfoCopyWith<$Res> implements $GroupInfoCopyWith<$Res> {
  factory _$GroupInfoCopyWith(
          _GroupInfo value, $Res Function(_GroupInfo) then) =
      __$GroupInfoCopyWithImpl<$Res>;
  @override
  $Res call({String name, String id, String userId});
}

/// @nodoc
class __$GroupInfoCopyWithImpl<$Res> extends _$GroupInfoCopyWithImpl<$Res>
    implements _$GroupInfoCopyWith<$Res> {
  __$GroupInfoCopyWithImpl(_GroupInfo _value, $Res Function(_GroupInfo) _then)
      : super(_value, (v) => _then(v as _GroupInfo));

  @override
  _GroupInfo get _value => super._value as _GroupInfo;

  @override
  $Res call({
    Object name = freezed,
    Object id = freezed,
    Object userId = freezed,
  }) {
    return _then(_GroupInfo(
      name: name == freezed ? _value.name : name as String,
      id: id == freezed ? _value.id : id as String,
      userId: userId == freezed ? _value.userId : userId as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GroupInfo extends _GroupInfo with DiagnosticableTreeMixin {
  const _$_GroupInfo(
      {@required this.name, @required this.id, @required this.userId})
      : assert(name != null),
        assert(id != null),
        assert(userId != null),
        super._();

  factory _$_GroupInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_GroupInfoFromJson(json);

  @override
  final String name;
  @override
  final String id;
  @override
  final String userId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GroupInfo(name: $name, id: $id, userId: $userId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GroupInfo'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GroupInfo &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userId);

  @override
  _$GroupInfoCopyWith<_GroupInfo> get copyWith =>
      __$GroupInfoCopyWithImpl<_GroupInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GroupInfoToJson(this);
  }
}

abstract class _GroupInfo extends GroupInfo {
  const _GroupInfo._() : super._();
  const factory _GroupInfo(
      {@required String name,
      @required String id,
      @required String userId}) = _$_GroupInfo;

  factory _GroupInfo.fromJson(Map<String, dynamic> json) =
      _$_GroupInfo.fromJson;

  @override
  String get name;
  @override
  String get id;
  @override
  String get userId;
  @override
  _$GroupInfoCopyWith<_GroupInfo> get copyWith;
}
