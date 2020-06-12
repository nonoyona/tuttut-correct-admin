import 'package:correct/logic/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'exercise.freezed.dart';
part 'exercise.g.dart';

@freezed
abstract class Exercise implements _$Exercise {
  const Exercise._();
  const factory Exercise({@required String name, @required List<Task> tasks, @required bool published}) = _Exercise;

  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);

}

extension ExerciseExt on Exercise {}
