// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskNote _$_$_TaskNoteFromJson(Map<String, dynamic> json) {
  return _$_TaskNote(
    json['comment'] as String,
    (json['penalty'] as num)?.toDouble(),
    json['uid'] as int,
    json['part'] as String,
  );
}

Map<String, dynamic> _$_$_TaskNoteToJson(_$_TaskNote instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'penalty': instance.penalty,
      'uid': instance.uid,
      'part': instance.part,
    };
