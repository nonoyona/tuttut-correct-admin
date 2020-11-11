// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubmissionInfo _$_$_SubmissionInfoFromJson(Map<String, dynamic> json) {
  return _$_SubmissionInfo(
    id: json['id'] as String,
    participants: (json['participants'] as List)
        ?.map((e) =>
            e == null ? null : StudentInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    passed: json['passed'] as bool,
    points: json['points'] == null
        ? null
        : Points.fromJson(json['points'] as Map<String, dynamic>),
    correction: json['correction'] as String,
    userId: json['userId'] as String,
    groupId: json['groupId'] as String,
    exerciseId: json['exerciseId'] as String,
  );
}

Map<String, dynamic> _$_$_SubmissionInfoToJson(_$_SubmissionInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'participants': instance.participants?.map((e) => e?.toJson())?.toList(),
      'passed': instance.passed,
      'points': instance.points?.toJson(),
      'correction': instance.correction,
      'userId': instance.userId,
      'groupId': instance.groupId,
      'exerciseId': instance.exerciseId,
    };
