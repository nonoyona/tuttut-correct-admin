import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'task_note.freezed.dart';
part 'task_note.g.dart';

@freezed
abstract class TaskNote implements _$TaskNote{
  const TaskNote._();
  const factory TaskNote(String comment, double penalty, int uid, @nullable String part) = _TaskNote;
  factory TaskNote.fromJson(Map<String, dynamic> json) => _$TaskNoteFromJson(json);
}

extension TaskNoteExt on TaskNote{

}