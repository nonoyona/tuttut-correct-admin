import 'package:correct/logic/dataobjects/points.dart';
import 'package:correct/logic/dataobjects/student_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'submission_info.freezed.dart';
part 'submission_info.g.dart';

@freezed
abstract class SubmissionInfo implements _$SubmissionInfo {
  const SubmissionInfo._();
  const factory SubmissionInfo({
    @required String id,
    @required List<StudentInfo> participants,
    @required bool passed,
    @required Points points,
    @required String correction,
    @required String userId,
    @required String groupId,
    @required String exerciseId,
  }) = _SubmissionInfo;
  factory SubmissionInfo.fromJson(Map<String, dynamic> json) =>
      _$SubmissionInfoFromJson(json);
}
