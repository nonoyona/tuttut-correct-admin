// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Exercise _$_$_ExerciseFromJson(Map<String, dynamic> json) {
  return _$_Exercise(
    name: json['name'] as String,
    tasks: (json['tasks'] as List)
        ?.map(
            (e) => e == null ? null : Task.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    published: json['published'] as bool,
  );
}

Map<String, dynamic> _$_$_ExerciseToJson(_$_Exercise instance) =>
    <String, dynamic>{
      'name': instance.name,
      'tasks': instance.tasks?.map((e) => e?.toJson())?.toList(),
      'published': instance.published,
    };
