// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'task_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
TaskNote _$TaskNoteFromJson(Map<String, dynamic> json) {
  return _TaskNote.fromJson(json);
}

class _$TaskNoteTearOff {
  const _$TaskNoteTearOff();

  _TaskNote call(
      String comment, double penalty, int uid, @nullable String part) {
    return _TaskNote(
      comment,
      penalty,
      uid,
      part,
    );
  }
}

// ignore: unused_element
const $TaskNote = _$TaskNoteTearOff();

mixin _$TaskNote {
  String get comment;
  double get penalty;
  int get uid;
  @nullable
  String get part;

  Map<String, dynamic> toJson();
  $TaskNoteCopyWith<TaskNote> get copyWith;
}

abstract class $TaskNoteCopyWith<$Res> {
  factory $TaskNoteCopyWith(TaskNote value, $Res Function(TaskNote) then) =
      _$TaskNoteCopyWithImpl<$Res>;
  $Res call({String comment, double penalty, int uid, @nullable String part});
}

class _$TaskNoteCopyWithImpl<$Res> implements $TaskNoteCopyWith<$Res> {
  _$TaskNoteCopyWithImpl(this._value, this._then);

  final TaskNote _value;
  // ignore: unused_field
  final $Res Function(TaskNote) _then;

  @override
  $Res call({
    Object comment = freezed,
    Object penalty = freezed,
    Object uid = freezed,
    Object part = freezed,
  }) {
    return _then(_value.copyWith(
      comment: comment == freezed ? _value.comment : comment as String,
      penalty: penalty == freezed ? _value.penalty : penalty as double,
      uid: uid == freezed ? _value.uid : uid as int,
      part: part == freezed ? _value.part : part as String,
    ));
  }
}

abstract class _$TaskNoteCopyWith<$Res> implements $TaskNoteCopyWith<$Res> {
  factory _$TaskNoteCopyWith(_TaskNote value, $Res Function(_TaskNote) then) =
      __$TaskNoteCopyWithImpl<$Res>;
  @override
  $Res call({String comment, double penalty, int uid, @nullable String part});
}

class __$TaskNoteCopyWithImpl<$Res> extends _$TaskNoteCopyWithImpl<$Res>
    implements _$TaskNoteCopyWith<$Res> {
  __$TaskNoteCopyWithImpl(_TaskNote _value, $Res Function(_TaskNote) _then)
      : super(_value, (v) => _then(v as _TaskNote));

  @override
  _TaskNote get _value => super._value as _TaskNote;

  @override
  $Res call({
    Object comment = freezed,
    Object penalty = freezed,
    Object uid = freezed,
    Object part = freezed,
  }) {
    return _then(_TaskNote(
      comment == freezed ? _value.comment : comment as String,
      penalty == freezed ? _value.penalty : penalty as double,
      uid == freezed ? _value.uid : uid as int,
      part == freezed ? _value.part : part as String,
    ));
  }
}

@JsonSerializable()
class _$_TaskNote extends _TaskNote with DiagnosticableTreeMixin {
  const _$_TaskNote(this.comment, this.penalty, this.uid, @nullable this.part)
      : assert(comment != null),
        assert(penalty != null),
        assert(uid != null),
        super._();

  factory _$_TaskNote.fromJson(Map<String, dynamic> json) =>
      _$_$_TaskNoteFromJson(json);

  @override
  final String comment;
  @override
  final double penalty;
  @override
  final int uid;
  @override
  @nullable
  final String part;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TaskNote(comment: $comment, penalty: $penalty, uid: $uid, part: $part)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TaskNote'))
      ..add(DiagnosticsProperty('comment', comment))
      ..add(DiagnosticsProperty('penalty', penalty))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('part', part));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TaskNote &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.penalty, penalty) ||
                const DeepCollectionEquality()
                    .equals(other.penalty, penalty)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.part, part) ||
                const DeepCollectionEquality().equals(other.part, part)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(penalty) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(part);

  @override
  _$TaskNoteCopyWith<_TaskNote> get copyWith =>
      __$TaskNoteCopyWithImpl<_TaskNote>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TaskNoteToJson(this);
  }
}

abstract class _TaskNote extends TaskNote {
  const _TaskNote._() : super._();
  const factory _TaskNote(
          String comment, double penalty, int uid, @nullable String part) =
      _$_TaskNote;

  factory _TaskNote.fromJson(Map<String, dynamic> json) = _$_TaskNote.fromJson;

  @override
  String get comment;
  @override
  double get penalty;
  @override
  int get uid;
  @override
  @nullable
  String get part;
  @override
  _$TaskNoteCopyWith<_TaskNote> get copyWith;
}
