// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'submission_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SubmissionInfo _$SubmissionInfoFromJson(Map<String, dynamic> json) {
  return _SubmissionInfo.fromJson(json);
}

/// @nodoc
class _$SubmissionInfoTearOff {
  const _$SubmissionInfoTearOff();

// ignore: unused_element
  _SubmissionInfo call(
      {@required String id,
      @required List<StudentInfo> participants,
      @required bool passed,
      @required Points points,
      @required String correction,
      @required String userId,
      @required String groupId,
      @required String exerciseId}) {
    return _SubmissionInfo(
      id: id,
      participants: participants,
      passed: passed,
      points: points,
      correction: correction,
      userId: userId,
      groupId: groupId,
      exerciseId: exerciseId,
    );
  }

// ignore: unused_element
  SubmissionInfo fromJson(Map<String, Object> json) {
    return SubmissionInfo.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SubmissionInfo = _$SubmissionInfoTearOff();

/// @nodoc
mixin _$SubmissionInfo {
  String get id;
  List<StudentInfo> get participants;
  bool get passed;
  Points get points;
  String get correction;
  String get userId;
  String get groupId;
  String get exerciseId;

  Map<String, dynamic> toJson();
  $SubmissionInfoCopyWith<SubmissionInfo> get copyWith;
}

/// @nodoc
abstract class $SubmissionInfoCopyWith<$Res> {
  factory $SubmissionInfoCopyWith(
          SubmissionInfo value, $Res Function(SubmissionInfo) then) =
      _$SubmissionInfoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      List<StudentInfo> participants,
      bool passed,
      Points points,
      String correction,
      String userId,
      String groupId,
      String exerciseId});

  $PointsCopyWith<$Res> get points;
}

/// @nodoc
class _$SubmissionInfoCopyWithImpl<$Res>
    implements $SubmissionInfoCopyWith<$Res> {
  _$SubmissionInfoCopyWithImpl(this._value, this._then);

  final SubmissionInfo _value;
  // ignore: unused_field
  final $Res Function(SubmissionInfo) _then;

  @override
  $Res call({
    Object id = freezed,
    Object participants = freezed,
    Object passed = freezed,
    Object points = freezed,
    Object correction = freezed,
    Object userId = freezed,
    Object groupId = freezed,
    Object exerciseId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      participants: participants == freezed
          ? _value.participants
          : participants as List<StudentInfo>,
      passed: passed == freezed ? _value.passed : passed as bool,
      points: points == freezed ? _value.points : points as Points,
      correction:
          correction == freezed ? _value.correction : correction as String,
      userId: userId == freezed ? _value.userId : userId as String,
      groupId: groupId == freezed ? _value.groupId : groupId as String,
      exerciseId:
          exerciseId == freezed ? _value.exerciseId : exerciseId as String,
    ));
  }

  @override
  $PointsCopyWith<$Res> get points {
    if (_value.points == null) {
      return null;
    }
    return $PointsCopyWith<$Res>(_value.points, (value) {
      return _then(_value.copyWith(points: value));
    });
  }
}

/// @nodoc
abstract class _$SubmissionInfoCopyWith<$Res>
    implements $SubmissionInfoCopyWith<$Res> {
  factory _$SubmissionInfoCopyWith(
          _SubmissionInfo value, $Res Function(_SubmissionInfo) then) =
      __$SubmissionInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      List<StudentInfo> participants,
      bool passed,
      Points points,
      String correction,
      String userId,
      String groupId,
      String exerciseId});

  @override
  $PointsCopyWith<$Res> get points;
}

/// @nodoc
class __$SubmissionInfoCopyWithImpl<$Res>
    extends _$SubmissionInfoCopyWithImpl<$Res>
    implements _$SubmissionInfoCopyWith<$Res> {
  __$SubmissionInfoCopyWithImpl(
      _SubmissionInfo _value, $Res Function(_SubmissionInfo) _then)
      : super(_value, (v) => _then(v as _SubmissionInfo));

  @override
  _SubmissionInfo get _value => super._value as _SubmissionInfo;

  @override
  $Res call({
    Object id = freezed,
    Object participants = freezed,
    Object passed = freezed,
    Object points = freezed,
    Object correction = freezed,
    Object userId = freezed,
    Object groupId = freezed,
    Object exerciseId = freezed,
  }) {
    return _then(_SubmissionInfo(
      id: id == freezed ? _value.id : id as String,
      participants: participants == freezed
          ? _value.participants
          : participants as List<StudentInfo>,
      passed: passed == freezed ? _value.passed : passed as bool,
      points: points == freezed ? _value.points : points as Points,
      correction:
          correction == freezed ? _value.correction : correction as String,
      userId: userId == freezed ? _value.userId : userId as String,
      groupId: groupId == freezed ? _value.groupId : groupId as String,
      exerciseId:
          exerciseId == freezed ? _value.exerciseId : exerciseId as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SubmissionInfo extends _SubmissionInfo with DiagnosticableTreeMixin {
  const _$_SubmissionInfo(
      {@required this.id,
      @required this.participants,
      @required this.passed,
      @required this.points,
      @required this.correction,
      @required this.userId,
      @required this.groupId,
      @required this.exerciseId})
      : assert(id != null),
        assert(participants != null),
        assert(passed != null),
        assert(points != null),
        assert(correction != null),
        assert(userId != null),
        assert(groupId != null),
        assert(exerciseId != null),
        super._();

  factory _$_SubmissionInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_SubmissionInfoFromJson(json);

  @override
  final String id;
  @override
  final List<StudentInfo> participants;
  @override
  final bool passed;
  @override
  final Points points;
  @override
  final String correction;
  @override
  final String userId;
  @override
  final String groupId;
  @override
  final String exerciseId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubmissionInfo(id: $id, participants: $participants, passed: $passed, points: $points, correction: $correction, userId: $userId, groupId: $groupId, exerciseId: $exerciseId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SubmissionInfo'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('participants', participants))
      ..add(DiagnosticsProperty('passed', passed))
      ..add(DiagnosticsProperty('points', points))
      ..add(DiagnosticsProperty('correction', correction))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('groupId', groupId))
      ..add(DiagnosticsProperty('exerciseId', exerciseId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SubmissionInfo &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.participants, participants) ||
                const DeepCollectionEquality()
                    .equals(other.participants, participants)) &&
            (identical(other.passed, passed) ||
                const DeepCollectionEquality().equals(other.passed, passed)) &&
            (identical(other.points, points) ||
                const DeepCollectionEquality().equals(other.points, points)) &&
            (identical(other.correction, correction) ||
                const DeepCollectionEquality()
                    .equals(other.correction, correction)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.groupId, groupId) ||
                const DeepCollectionEquality()
                    .equals(other.groupId, groupId)) &&
            (identical(other.exerciseId, exerciseId) ||
                const DeepCollectionEquality()
                    .equals(other.exerciseId, exerciseId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(participants) ^
      const DeepCollectionEquality().hash(passed) ^
      const DeepCollectionEquality().hash(points) ^
      const DeepCollectionEquality().hash(correction) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(groupId) ^
      const DeepCollectionEquality().hash(exerciseId);

  @override
  _$SubmissionInfoCopyWith<_SubmissionInfo> get copyWith =>
      __$SubmissionInfoCopyWithImpl<_SubmissionInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SubmissionInfoToJson(this);
  }
}

abstract class _SubmissionInfo extends SubmissionInfo {
  const _SubmissionInfo._() : super._();
  const factory _SubmissionInfo(
      {@required String id,
      @required List<StudentInfo> participants,
      @required bool passed,
      @required Points points,
      @required String correction,
      @required String userId,
      @required String groupId,
      @required String exerciseId}) = _$_SubmissionInfo;

  factory _SubmissionInfo.fromJson(Map<String, dynamic> json) =
      _$_SubmissionInfo.fromJson;

  @override
  String get id;
  @override
  List<StudentInfo> get participants;
  @override
  bool get passed;
  @override
  Points get points;
  @override
  String get correction;
  @override
  String get userId;
  @override
  String get groupId;
  @override
  String get exerciseId;
  @override
  _$SubmissionInfoCopyWith<_SubmissionInfo> get copyWith;
}
