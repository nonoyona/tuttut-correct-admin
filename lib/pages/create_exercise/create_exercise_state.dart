import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'create_exercise_state.freezed.dart';

@freezed
abstract class CreateExerciseState with _$CreateExerciseState {
  const factory CreateExerciseState.standard({@required bool failed}) = _Standard;
  const factory CreateExerciseState.submitting() = _Submitting;
  const factory CreateExerciseState.success() = _Success;
}
