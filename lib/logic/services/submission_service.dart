import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:correct/logic/dataobjects/student_info.dart';
import 'package:correct/logic/dataobjects/submission_info.dart';
import 'package:correct/logic/services/auth_service.dart';
import 'package:correct/logic/services/correction_parser.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class SubmissionService {
  static final instance = SubmissionService._();
  SubmissionService._();

  Stream<List<SubmissionInfo>> listenToSubmissionInfos(
      String exerciseId) async* {
    final user = await AuthService.instance.getUser();
    yield* Firestore.instance
        .collection("submissions")
        .where("userId", isEqualTo: user.uid)
        .where("exerciseId", isEqualTo: exerciseId)
        .snapshots()
        .map(
          (event) => event.documents
              .map((e) => SubmissionInfo.fromJson(e.data))
              .toList(),
        );
  }

  Future<SubmissionInfo> fetchSubmissionInfo(String submissionId) async {
    final doc = await Firestore.instance
        .collection("submissions")
        .document(submissionId)
        .get();
    if (!doc.exists) return null;
    return SubmissionInfo.fromJson(doc.data);
  }

  Future<List<SubmissionInfo>> fetchGroupSubmissionInfos(String groupId) async {
    final user = await AuthService.instance.getUser();
    final snapshots = await Firestore.instance
        .collection("submissions")
        .where("userId", isEqualTo: user.uid)
        .where("groupId", isEqualTo: groupId)
        .getDocuments();
    return snapshots.documents
        .map((e) => SubmissionInfo.fromJson(e.data))
        .toList();
  }

  Future<SubmissionInfo> createSubmission({
    @required List<StudentInfo> participants,
    @required String exerciseId,
    @required String groupId,
    String correction,
  }) async {
    final collection = Firestore.instance.collection("submissions");
    final user = await AuthService.instance.getUser();
    final id = Uuid().v4();
    final info = SubmissionInfo(
      exerciseId: exerciseId,
      groupId: groupId,
      userId: user.uid,
      id: id,
      participants: participants,
      passed: false,
      points: CorrectionParser(correction: correction ?? "").getPoints(),
      correction: correction ?? "",
    );
    await collection.document(id).setData(info.toJson());
    return info;
  }

  Future updateSubmission(SubmissionInfo info) async {
    final collection = Firestore.instance.collection("submissions");
    await collection.document(info.id).setData(info.toJson());
  }
}
