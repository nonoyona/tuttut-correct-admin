import 'dart:convert';
import 'dart:typed_data';

import 'package:correct/logic/dataobjects/submission_info.dart';
import 'package:correct/logic/services/api_service.dart';
import 'package:correct/logic/services/student_service.dart';
import 'package:correct/logic/services/submission_service.dart';
import 'package:correct/pages/exercise/exercise_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseLogic extends Cubit<ExerciseState> {
  final String groupId;
  final String exerciseId;
  ExerciseLogic({
    @required this.groupId,
    @required this.exerciseId,
  }) : super(ExerciseState.loading()) {
    SubmissionService.instance
        .listenToSubmissionInfos(exerciseId)
        .listen((event) {
      emit(ExerciseState.loaded(event));
    });
  }

  Future<SubmissionInfo> dropFile(Uint8List fileData, String fileName) async {
    final correction = utf8.decoder.convert(fileData);
    final names = fileName.split(".")[0].split("_");
    final students = await StudentService.instance.fetchStudents(groupId);
    final participants = names
        .map((e) => StudentService.instance.tryFindStudent(e, students))
        .where((element) => element != null)
        .toList();
    participants.forEach((e) => print(e));
    return SubmissionService.instance.createSubmission(
      exerciseId: exerciseId,
      groupId: groupId,
      participants: participants,
      correction: correction,
    );
  }

  static ExerciseLogic of(BuildContext context) =>
      BlocProvider.of<ExerciseLogic>(context);
}
