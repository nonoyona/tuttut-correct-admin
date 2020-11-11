import 'package:correct/logic/dataobjects/student_info.dart';
import 'package:correct/logic/dataobjects/submission_info.dart';
import 'package:correct/pages/submission/submission_logic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'create_submission_state.freezed.dart';

@freezed
abstract class CreateSubmissionState with _$CreateSubmissionState {
  const factory CreateSubmissionState.loading({
    @required List<StudentInfo> participants,
    @required List<StudentInfo> students,
  }) = _Loading;
  const factory CreateSubmissionState.loaded({
    @required List<StudentInfo> participants,
    @required List<StudentInfo> students,
    @required bool failedEvent,
  }) = _Loaded;
  const factory CreateSubmissionState.submitting({
    @required List<StudentInfo> participants,
    @required List<StudentInfo> students,
  }) = _Submitting;
  const factory CreateSubmissionState.success({
    @required List<StudentInfo> participants,
    @required List<StudentInfo> students,
    @required SubmissionInfo submission,
  }) = _Success;
}
