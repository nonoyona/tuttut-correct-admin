// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'submission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Submission _$SubmissionFromJson(Map<String, dynamic> json) {
  return _Submission.fromJson(json);
}

class _$SubmissionTearOff {
  const _$SubmissionTearOff();

  _Submission call(
      List<TaskSubmission> tasks, List<String> contributors, String name) {
    return _Submission(
      tasks,
      contributors,
      name,
    );
  }
}

// ignore: unused_element
const $Submission = _$SubmissionTearOff();

mixin _$Submission {
  List<TaskSubmission> get tasks;
  List<String> get contributors;
  String get name;

  Map<String, dynamic> toJson();
  $SubmissionCopyWith<Submission> get copyWith;
}

abstract class $SubmissionCopyWith<$Res> {
  factory $SubmissionCopyWith(
          Submission value, $Res Function(Submission) then) =
      _$SubmissionCopyWithImpl<$Res>;
  $Res call(
      {List<TaskSubmission> tasks, List<String> contributors, String name});
}

class _$SubmissionCopyWithImpl<$Res> implements $SubmissionCopyWith<$Res> {
  _$SubmissionCopyWithImpl(this._value, this._then);

  final Submission _value;
  // ignore: unused_field
  final $Res Function(Submission) _then;

  @override
  $Res call({
    Object tasks = freezed,
    Object contributors = freezed,
    Object name = freezed,
  }) {
    return _then(_value.copyWith(
      tasks: tasks == freezed ? _value.tasks : tasks as List<TaskSubmission>,
      contributors: contributors == freezed
          ? _value.contributors
          : contributors as List<String>,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

abstract class _$SubmissionCopyWith<$Res> implements $SubmissionCopyWith<$Res> {
  factory _$SubmissionCopyWith(
          _Submission value, $Res Function(_Submission) then) =
      __$SubmissionCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<TaskSubmission> tasks, List<String> contributors, String name});
}

class __$SubmissionCopyWithImpl<$Res> extends _$SubmissionCopyWithImpl<$Res>
    implements _$SubmissionCopyWith<$Res> {
  __$SubmissionCopyWithImpl(
      _Submission _value, $Res Function(_Submission) _then)
      : super(_value, (v) => _then(v as _Submission));

  @override
  _Submission get _value => super._value as _Submission;

  @override
  $Res call({
    Object tasks = freezed,
    Object contributors = freezed,
    Object name = freezed,
  }) {
    return _then(_Submission(
      tasks == freezed ? _value.tasks : tasks as List<TaskSubmission>,
      contributors == freezed
          ? _value.contributors
          : contributors as List<String>,
      name == freezed ? _value.name : name as String,
    ));
  }
}

@JsonSerializable()
class _$_Submission extends _Submission with DiagnosticableTreeMixin {
  const _$_Submission(this.tasks, this.contributors, this.name)
      : assert(tasks != null),
        assert(contributors != null),
        assert(name != null),
        super._();

  factory _$_Submission.fromJson(Map<String, dynamic> json) =>
      _$_$_SubmissionFromJson(json);

  @override
  final List<TaskSubmission> tasks;
  @override
  final List<String> contributors;
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Submission(tasks: $tasks, contributors: $contributors, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Submission'))
      ..add(DiagnosticsProperty('tasks', tasks))
      ..add(DiagnosticsProperty('contributors', contributors))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Submission &&
            (identical(other.tasks, tasks) ||
                const DeepCollectionEquality().equals(other.tasks, tasks)) &&
            (identical(other.contributors, contributors) ||
                const DeepCollectionEquality()
                    .equals(other.contributors, contributors)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tasks) ^
      const DeepCollectionEquality().hash(contributors) ^
      const DeepCollectionEquality().hash(name);

  @override
  _$SubmissionCopyWith<_Submission> get copyWith =>
      __$SubmissionCopyWithImpl<_Submission>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SubmissionToJson(this);
  }
}

abstract class _Submission extends Submission {
  const _Submission._() : super._();
  const factory _Submission(
          List<TaskSubmission> tasks, List<String> contributors, String name) =
      _$_Submission;

  factory _Submission.fromJson(Map<String, dynamic> json) =
      _$_Submission.fromJson;

  @override
  List<TaskSubmission> get tasks;
  @override
  List<String> get contributors;
  @override
  String get name;
  @override
  _$SubmissionCopyWith<_Submission> get copyWith;
}
