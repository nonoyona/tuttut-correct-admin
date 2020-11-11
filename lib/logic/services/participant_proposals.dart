import 'dart:async';

import 'package:correct/logic/dataobjects/student_info.dart';
import 'package:correct/logic/dataobjects/submission_info.dart';
import 'package:correct/logic/services/student_service.dart';
import 'package:correct/logic/services/submission_service.dart';
import 'package:correct/utils/utils.dart';
import 'package:tuple/tuple.dart';

class ParticipantPorposalService {
  static final instance = ParticipantPorposalService._();

  ParticipantPorposalService._();

  String _currentGroup;
  List<StudentInfo> _currentUsers;
  List<SubmissionInfo> _currentSubmissions;

  Future<List<StudentInfo>> getAll(String groupId) async {
    await _ensureDataAvailable(groupId);
    return _currentUsers;
  }

  Future<List<StudentInfo>> getProposals(String groupId, String searchString,
      List<StudentInfo> participants) async {
    await _ensureDataAvailable(groupId);
    final filteredUsers = _currentUsers
        .where(
          (element) =>
              element.name.toLowerCase().contains(searchString.toLowerCase()) ||
              searchString.toLowerCase().contains(element.name.toLowerCase()),
        )
        .where((element) => !participants.contains(element))
        .toList();
    return _getWeightSorted(filteredUsers, participants);
  }

  List<StudentInfo> _getWeightSorted(
    List<StudentInfo> students,
    List<StudentInfo> participants,
  ) {
    final weightedUsers = students
        .map(
          (e) => Tuple2(
            e,
            _currentSubmissions
                .where(
                  (element) => element.participants.contains(e),
                )
                .where(
                  (element) => participants.any(
                    (e1) => element.participants.contains(e1),
                  ),
                )
                .length,
          ),
        )
        .toList();
    weightedUsers.stableSort((a, b) => -a.item2.compareTo(b.item2));
    return weightedUsers.map((e) => e.item1).toList();
  }

  Future<void> _ensureDataAvailable(String groupId) async {
    if (_currentGroup == groupId && _currentUsers != null) return _currentUsers;
    final students = StudentService.instance.fetchStudents(groupId);
    final submissions = SubmissionService.instance.fetchGroupSubmissionInfos(groupId);
    _currentGroup = groupId;
    _currentUsers = await students;
    _currentSubmissions = await submissions;
    _currentUsers.sort((a, b) => a.name.compareTo(b.name));
    return;
  }

}
