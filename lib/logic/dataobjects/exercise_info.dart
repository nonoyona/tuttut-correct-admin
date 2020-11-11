import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'exercise_info.freezed.dart';
part 'exercise_info.g.dart';

@freezed
abstract class ExerciseInfo implements _$ExerciseInfo {
  const ExerciseInfo._();
  const factory ExerciseInfo({
    @required String id,
    @required String name,
    @required String userId,
    @required String groupId,
  }) = _ExerciseInfo;
  factory ExerciseInfo.fromJson(Map<String, dynamic> json) =>
      _$ExerciseInfoFromJson(json);
}
