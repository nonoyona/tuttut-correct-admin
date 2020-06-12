// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Submission _$_$_SubmissionFromJson(Map<String, dynamic> json) {
  return _$_Submission(
    (json['tasks'] as List)
        ?.map((e) => e == null
            ? null
            : TaskSubmission.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['contributors'] as List)?.map((e) => e as String)?.toList(),
    json['name'] as String,
  );
}

Map<String, dynamic> _$_$_SubmissionToJson(_$_Submission instance) =>
    <String, dynamic>{
      'tasks': instance.tasks?.map((e) => e?.toJson())?.toList(),
      'contributors': instance.contributors,
      'name': instance.name,
    };
