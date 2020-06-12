// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'task_submission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
TaskSubmission _$TaskSubmissionFromJson(Map<String, dynamic> json) {
  return _TaskSubmission.fromJson(json);
}

class _$TaskSubmissionTearOff {
  const _$TaskSubmissionTearOff();

  _TaskSubmission call(String name, int maximumPoints, List<TaskNote> notes,
      @nullable List<String> votedBy) {
    return _TaskSubmission(
      name,
      maximumPoints,
      notes,
      votedBy,
    );
  }
}

// ignore: unused_element
const $TaskSubmission = _$TaskSubmissionTearOff();

mixin _$TaskSubmission {
  String get name;
  int get maximumPoints;
  List<TaskNote> get notes;
  @nullable
  List<String> get votedBy;

  Map<String, dynamic> toJson();
  $TaskSubmissionCopyWith<TaskSubmission> get copyWith;
}

abstract class $TaskSubmissionCopyWith<$Res> {
  factory $TaskSubmissionCopyWith(
          TaskSubmission value, $Res Function(TaskSubmission) then) =
      _$TaskSubmissionCopyWithImpl<$Res>;
  $Res call(
      {String name,
      int maximumPoints,
      List<TaskNote> notes,
      @nullable List<String> votedBy});
}

class _$TaskSubmissionCopyWithImpl<$Res>
    implements $TaskSubmissionCopyWith<$Res> {
  _$TaskSubmissionCopyWithImpl(this._value, this._then);

  final TaskSubmission _value;
  // ignore: unused_field
  final $Res Function(TaskSubmission) _then;

  @override
  $Res call({
    Object name = freezed,
    Object maximumPoints = freezed,
    Object notes = freezed,
    Object votedBy = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      maximumPoints: maximumPoints == freezed
          ? _value.maximumPoints
          : maximumPoints as int,
      notes: notes == freezed ? _value.notes : notes as List<TaskNote>,
      votedBy: votedBy == freezed ? _value.votedBy : votedBy as List<String>,
    ));
  }
}

abstract class _$TaskSubmissionCopyWith<$Res>
    implements $TaskSubmissionCopyWith<$Res> {
  factory _$TaskSubmissionCopyWith(
          _TaskSubmission value, $Res Function(_TaskSubmission) then) =
      __$TaskSubmissionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      int maximumPoints,
      List<TaskNote> notes,
      @nullable List<String> votedBy});
}

class __$TaskSubmissionCopyWithImpl<$Res>
    extends _$TaskSubmissionCopyWithImpl<$Res>
    implements _$TaskSubmissionCopyWith<$Res> {
  __$TaskSubmissionCopyWithImpl(
      _TaskSubmission _value, $Res Function(_TaskSubmission) _then)
      : super(_value, (v) => _then(v as _TaskSubmission));

  @override
  _TaskSubmission get _value => super._value as _TaskSubmission;

  @override
  $Res call({
    Object name = freezed,
    Object maximumPoints = freezed,
    Object notes = freezed,
    Object votedBy = freezed,
  }) {
    return _then(_TaskSubmission(
      name == freezed ? _value.name : name as String,
      maximumPoints == freezed ? _value.maximumPoints : maximumPoints as int,
      notes == freezed ? _value.notes : notes as List<TaskNote>,
      votedBy == freezed ? _value.votedBy : votedBy as List<String>,
    ));
  }
}

@JsonSerializable()
class _$_TaskSubmission extends _TaskSubmission with DiagnosticableTreeMixin {
  const _$_TaskSubmission(
      this.name, this.maximumPoints, this.notes, @nullable this.votedBy)
      : assert(name != null),
        assert(maximumPoints != null),
        assert(notes != null),
        super._();

  factory _$_TaskSubmission.fromJson(Map<String, dynamic> json) =>
      _$_$_TaskSubmissionFromJson(json);

  @override
  final String name;
  @override
  final int maximumPoints;
  @override
  final List<TaskNote> notes;
  @override
  @nullable
  final List<String> votedBy;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TaskSubmission(name: $name, maximumPoints: $maximumPoints, notes: $notes, votedBy: $votedBy)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TaskSubmission'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('maximumPoints', maximumPoints))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('votedBy', votedBy));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TaskSubmission &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.maximumPoints, maximumPoints) ||
                const DeepCollectionEquality()
                    .equals(other.maximumPoints, maximumPoints)) &&
            (identical(other.notes, notes) ||
                const DeepCollectionEquality().equals(other.notes, notes)) &&
            (identical(other.votedBy, votedBy) ||
                const DeepCollectionEquality().equals(other.votedBy, votedBy)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(maximumPoints) ^
      const DeepCollectionEquality().hash(notes) ^
      const DeepCollectionEquality().hash(votedBy);

  @override
  _$TaskSubmissionCopyWith<_TaskSubmission> get copyWith =>
      __$TaskSubmissionCopyWithImpl<_TaskSubmission>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TaskSubmissionToJson(this);
  }
}

abstract class _TaskSubmission extends TaskSubmission {
  const _TaskSubmission._() : super._();
  const factory _TaskSubmission(String name, int maximumPoints,
      List<TaskNote> notes, @nullable List<String> votedBy) = _$_TaskSubmission;

  factory _TaskSubmission.fromJson(Map<String, dynamic> json) =
      _$_TaskSubmission.fromJson;

  @override
  String get name;
  @override
  int get maximumPoints;
  @override
  List<TaskNote> get notes;
  @override
  @nullable
  List<String> get votedBy;
  @override
  _$TaskSubmissionCopyWith<_TaskSubmission> get copyWith;
}
