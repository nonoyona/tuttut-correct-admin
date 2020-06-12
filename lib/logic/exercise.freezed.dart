// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Exercise _$ExerciseFromJson(Map<String, dynamic> json) {
  return _Exercise.fromJson(json);
}

class _$ExerciseTearOff {
  const _$ExerciseTearOff();

  _Exercise call(
      {@required String name,
      @required List<Task> tasks,
      @required bool published}) {
    return _Exercise(
      name: name,
      tasks: tasks,
      published: published,
    );
  }
}

// ignore: unused_element
const $Exercise = _$ExerciseTearOff();

mixin _$Exercise {
  String get name;
  List<Task> get tasks;
  bool get published;

  Map<String, dynamic> toJson();
  $ExerciseCopyWith<Exercise> get copyWith;
}

abstract class $ExerciseCopyWith<$Res> {
  factory $ExerciseCopyWith(Exercise value, $Res Function(Exercise) then) =
      _$ExerciseCopyWithImpl<$Res>;
  $Res call({String name, List<Task> tasks, bool published});
}

class _$ExerciseCopyWithImpl<$Res> implements $ExerciseCopyWith<$Res> {
  _$ExerciseCopyWithImpl(this._value, this._then);

  final Exercise _value;
  // ignore: unused_field
  final $Res Function(Exercise) _then;

  @override
  $Res call({
    Object name = freezed,
    Object tasks = freezed,
    Object published = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      tasks: tasks == freezed ? _value.tasks : tasks as List<Task>,
      published: published == freezed ? _value.published : published as bool,
    ));
  }
}

abstract class _$ExerciseCopyWith<$Res> implements $ExerciseCopyWith<$Res> {
  factory _$ExerciseCopyWith(_Exercise value, $Res Function(_Exercise) then) =
      __$ExerciseCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<Task> tasks, bool published});
}

class __$ExerciseCopyWithImpl<$Res> extends _$ExerciseCopyWithImpl<$Res>
    implements _$ExerciseCopyWith<$Res> {
  __$ExerciseCopyWithImpl(_Exercise _value, $Res Function(_Exercise) _then)
      : super(_value, (v) => _then(v as _Exercise));

  @override
  _Exercise get _value => super._value as _Exercise;

  @override
  $Res call({
    Object name = freezed,
    Object tasks = freezed,
    Object published = freezed,
  }) {
    return _then(_Exercise(
      name: name == freezed ? _value.name : name as String,
      tasks: tasks == freezed ? _value.tasks : tasks as List<Task>,
      published: published == freezed ? _value.published : published as bool,
    ));
  }
}

@JsonSerializable()
class _$_Exercise extends _Exercise with DiagnosticableTreeMixin {
  const _$_Exercise(
      {@required this.name, @required this.tasks, @required this.published})
      : assert(name != null),
        assert(tasks != null),
        assert(published != null),
        super._();

  factory _$_Exercise.fromJson(Map<String, dynamic> json) =>
      _$_$_ExerciseFromJson(json);

  @override
  final String name;
  @override
  final List<Task> tasks;
  @override
  final bool published;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Exercise(name: $name, tasks: $tasks, published: $published)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Exercise'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('tasks', tasks))
      ..add(DiagnosticsProperty('published', published));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Exercise &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.tasks, tasks) ||
                const DeepCollectionEquality().equals(other.tasks, tasks)) &&
            (identical(other.published, published) ||
                const DeepCollectionEquality()
                    .equals(other.published, published)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(tasks) ^
      const DeepCollectionEquality().hash(published);

  @override
  _$ExerciseCopyWith<_Exercise> get copyWith =>
      __$ExerciseCopyWithImpl<_Exercise>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ExerciseToJson(this);
  }
}

abstract class _Exercise extends Exercise {
  const _Exercise._() : super._();
  const factory _Exercise(
      {@required String name,
      @required List<Task> tasks,
      @required bool published}) = _$_Exercise;

  factory _Exercise.fromJson(Map<String, dynamic> json) = _$_Exercise.fromJson;

  @override
  String get name;
  @override
  List<Task> get tasks;
  @override
  bool get published;
  @override
  _$ExerciseCopyWith<_Exercise> get copyWith;
}
