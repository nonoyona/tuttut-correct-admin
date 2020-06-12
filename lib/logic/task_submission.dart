import 'dart:math';

import 'package:correct/logic/task_note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'task_submission.freezed.dart';
part 'task_submission.g.dart';

@freezed
abstract class TaskSubmission implements _$TaskSubmission {
  const TaskSubmission._();
  const factory TaskSubmission(
      String name, int maximumPoints, List<TaskNote> notes, @nullable List<String> votedBy) = _TaskSubmission;
  factory TaskSubmission.fromJson(Map<String, dynamic> json) =>
      _$TaskSubmissionFromJson(json);

      double get currentPoints => max(
        maximumPoints -
            (notes.isNotEmpty
                ? notes
                    .map((e) => e.penalty)
                    .reduce((value, element) => value + element)
                : 0),
        0,
      );
}

extension TaskSubmissionExt on TaskSubmission {
  
}
