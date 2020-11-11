import 'package:correct/logic/dataobjects/student_info.dart';
import 'package:correct/logic/services/api_service.dart';
import 'package:correct/logic/services/participant_proposals.dart';
import 'package:correct/logic/services/submission_service.dart';
import 'package:correct/pages/create_submission/create_submission_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateSubmissionLogic extends Cubit<CreateSubmissionState> {
  final String groupId;
  final String exerciseId;
  final TextEditingController searchController = TextEditingController();
  CreateSubmissionLogic({
    @required this.groupId,
    @required this.exerciseId,
  }) : super(CreateSubmissionState.loading(participants: [], students: [])) {
    ParticipantPorposalService.instance.getAll(groupId).then(
          (value) => emit(CreateSubmissionState.loaded(
            participants: state.participants,
            students: value,
            failedEvent: false,
          )),
        );
  }

  Future changeSearchString() async {
    final newStudents = await ParticipantPorposalService.instance
        .getProposals(groupId, searchController.text, state.participants);
    emit(state.copyWith.call(students: newStudents));
  }

  void addIfUnique() {
    if (state.students.length == 1) {
      addStudent(state.students.first);
    }
  }

  void create() async {
    if (state.participants.isEmpty) return;
    emit(CreateSubmissionState.submitting(
      participants: state.participants,
      students: state.students,
    ));
    final info = await SubmissionService.instance.createSubmission(
      exerciseId: exerciseId,
      groupId: groupId,
      participants: state.participants
    );
    emit(CreateSubmissionState.success(
      participants: state.participants,
      students: state.students,
      submission: info,
    ));
  }

  Future addStudent(StudentInfo info) async {
    if (state.participants.contains(info)) return;
    searchController.text = "";
    emit(state.copyWith
        .call(participants: List.of(state.participants)..add(info)));
    final newStudents = await ParticipantPorposalService.instance
        .getProposals(groupId, "", state.participants);
    emit(state.copyWith.call(students: newStudents));
  }

  Future removeStudent(StudentInfo info) async {
    if (!state.participants.contains(info)) return;
    emit(state.copyWith
        .call(participants: List.of(state.participants)..remove(info)));
    final newStudents = await ParticipantPorposalService.instance
        .getProposals(groupId, "", state.participants);
    emit(state.copyWith.call(students: newStudents));
  }

  static CreateSubmissionLogic of(BuildContext context) =>
      BlocProvider.of<CreateSubmissionLogic>(context);
}
