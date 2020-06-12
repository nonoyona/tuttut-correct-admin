// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Student _$_$_StudentFromJson(Map<String, dynamic> json) {
  return _$_Student(
    json['name'] as String,
    json['groupName'] as String,
    (json['votingPoints'] as List)?.map((e) => e as String)?.toList(),
    json['id'] as String,
  );
}

Map<String, dynamic> _$_$_StudentToJson(_$_Student instance) =>
    <String, dynamic>{
      'name': instance.name,
      'groupName': instance.groupName,
      'votingPoints': instance.votingPoints,
      'id': instance.id,
    };
