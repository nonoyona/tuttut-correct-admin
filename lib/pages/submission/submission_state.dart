import 'package:correct/logic/dataobjects/submission_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'submission_state.freezed.dart';

@freezed
abstract class SubmissionState with _$SubmissionState {
  const factory SubmissionState.loading() = _Loading;
  const factory SubmissionState.loaded(SubmissionInfo info, bool overrideTextField) = _Loaded;
}
