// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_submission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskSubmission _$_$_TaskSubmissionFromJson(Map<String, dynamic> json) {
  return _$_TaskSubmission(
    json['name'] as String,
    json['maximumPoints'] as int,
    (json['notes'] as List)
        ?.map((e) =>
            e == null ? null : TaskNote.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['votedBy'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$_$_TaskSubmissionToJson(_$_TaskSubmission instance) =>
    <String, dynamic>{
      'name': instance.name,
      'maximumPoints': instance.maximumPoints,
      'notes': instance.notes?.map((e) => e?.toJson())?.toList(),
      'votedBy': instance.votedBy,
    };
