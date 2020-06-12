// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$_$_TaskFromJson(Map<String, dynamic> json) {
  return _$_Task(
    name: json['name'] as String,
    points: json['points'] as int,
    uid: json['uid'] as int,
    parts: (json['parts'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$_$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'name': instance.name,
      'points': instance.points,
      'uid': instance.uid,
      'parts': instance.parts,
    };
