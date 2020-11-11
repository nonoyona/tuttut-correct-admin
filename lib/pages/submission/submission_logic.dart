import 'package:correct/logic/dataobjects/submission_info.dart';
import 'package:correct/logic/services/api_service.dart';
import 'package:correct/logic/services/correction_parser.dart';
import 'package:correct/logic/services/submission_service.dart';
import 'package:correct/pages/submission/submission_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmissionLogic extends Cubit<SubmissionState> {
  SubmissionLogic(String submissionId) : super(SubmissionState.loading()) {
    SubmissionService.instance.fetchSubmissionInfo(submissionId).then(
          (value) => emit(SubmissionState.loaded(value, true)),
        );
  }

  void setPassed(bool passed) {
    state.when(
      loading: () => null,
      loaded: (info, _) {
        final newInfo = info.copyWith.call(passed: passed);
        emit(SubmissionState.loaded(newInfo, false));
        _save(newInfo);
      },
    );
  }

  void correctionChanged(String value, [bool override = false]) {
    state.when(
      loading: () => null,
      loaded: (info, _) {
        final newInfo = info.copyWith.call(
          correction: value,
          points: CorrectionParser(correction: value).getPoints(),
        );
        emit(SubmissionState.loaded(newInfo, override));
        if (override) {
          _save(newInfo);
        }
      },
    );
  }

  void save() {
    state.when(
      loading: () => null,
      loaded: (info, _) {
        _save(info);
      },
    );
  }

  void _save(SubmissionInfo info) {
    SubmissionService.instance.updateSubmission(info);
  }

  static SubmissionLogic of(BuildContext context) =>
      BlocProvider.of<SubmissionLogic>(context);
}
