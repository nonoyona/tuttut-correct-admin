import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'student_info.freezed.dart';
part 'student_info.g.dart';

@freezed
abstract class StudentInfo implements _$StudentInfo {
  const StudentInfo._();
  const factory StudentInfo({
    @required String id,
    @required String name,
    @required String userId,
    @required String groupId,
  }) = _StudentInfo;
  factory StudentInfo.fromJson(Map<String, dynamic> json) =>
      _$StudentInfoFromJson(json);
}
