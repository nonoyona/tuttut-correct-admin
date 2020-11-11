import 'package:correct/logic/dataobjects/submission_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'exercise_state.freezed.dart';


@freezed
abstract class ExerciseState with _$ExerciseState{
  const factory ExerciseState.loading() = _Loading;
  const factory ExerciseState.loaded(List<SubmissionInfo> submissions) = _Loaded;
}
