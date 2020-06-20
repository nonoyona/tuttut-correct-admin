import 'package:correct/logic/student.dart';
import 'package:correct/logic/task_submission.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'submission.freezed.dart';
part 'submission.g.dart';

@freezed
abstract class Submission implements _$Submission {
  const Submission._();
  const factory Submission(
          List<TaskSubmission> tasks, List<String> contributors, String name) =
      _Submission;
  factory Submission.fromJson(Map<String, dynamic> json) =>
      _$SubmissionFromJson(json);

  List<Student> get studentContributors => contributors.map((e) {
        return Student.fromIdString(e);
      }).toList();

  int get maximumPoints => tasks.fold(
      0, (previousValue, element) => previousValue + element.maximumPoints);
  double get currentPoints => tasks.fold(
      0, (previousValue, element) => previousValue + element.currentPoints);
  int get taskCount => tasks.length;

  int getVotingPoints(String studentIdString) {
    return tasks
        .where((element) => element.votedBy.contains(studentIdString))
        .length;
  }

  int getVotingPointsOverHalf(String studentIdString) {
    return tasks
        .where((element) =>
            element.votedBy.contains(studentIdString) &&
            (element.currentPoints >= element.maximumPoints / 2.0))
        .length;
  }
}
