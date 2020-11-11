// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:correct/logic/services/auth_service.dart';
// import 'package:correct/logic/submission.dart';
// import 'package:correct/pages/correct_submission/task_tile.dart';
// import 'package:correct/utils/utils.dart';
// import 'package:flutter/foundation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'student.freezed.dart';
// part 'student.g.dart';

// @freezed
// abstract class Student implements _$Student {
//   const Student._();
//   const factory Student(
//           String name, String groupName, List<String> votingPoints, String id, @nullable bool passed) =
//       _Student;
//   factory Student.fromJson(Map<String, dynamic> json) =>
//       _$StudentFromJson(json);
//   factory Student.fromIdString(String e) {
//     List<String> parts = e.split("(");
//     String name = parts[0].trim();
//     String group = "";
//     if (parts.length > 1) {
//       group = parts[1].substring(0, parts.length - 1).trim();
//     }
//     return Student(name, group, [], "", null);
//   }

//   String get idString => "$name ($groupName)";

//   Future<List<Submission>> fetchAllSubmissions(AuthService service) async {
//     final adminUser = await service.getUser();
//     final exerciseQuerySnapshot =
//         await Firestore.instance.collection("${adminUser.uid}").getDocuments();
//     List<Future<QuerySnapshot>> futures = [];
//     for (var exercise in exerciseQuerySnapshot.documents) {
//       final future = Firestore.instance
//           .collection("${adminUser.uid}/${exercise.documentID}/submissions")
//           .where("contributors", arrayContains: idString)
//           .getDocuments();
//       futures.add(future);
//     }
//     final snapshots = await Future.wait(futures);
//     return snapshots
//         .where((element) => element.documents.length > 0)
//         .map((e) => Submission.fromJson(e.documents.first.data))
//         .toList();
//   }

//   Future<List<SubmissionWithExPath>> fetchAllSubmissionsWithExPath(
//       AuthService service) async {
//     final adminUser = await service.getUser();
//     final exerciseQuerySnapshot =
//         await Firestore.instance.collection("${adminUser.uid}").getDocuments();
//     List<Future<QuerySnapshot>> futures = [];
//     for (var exercise in exerciseQuerySnapshot.documents) {
//       final future = Firestore.instance
//           .collection("${adminUser.uid}/${exercise.documentID}/submissions")
//           .where("contributors", arrayContains: idString)
//           .getDocuments();
//       futures.add(future);
//     }
//     final snapshots = await Future.wait(futures);
//     return snapshots
//         .map((e) => e.documents.isEmpty
//             ? null
//             : [Submission.fromJson(e.documents.first.data), e.documents.first])
//         .mapIndexed((element, index) => SubmissionWithExPath(
//             snapshot: element?.last,
//             submission: element?.first,
//             exercisePath:
//                 exerciseQuerySnapshot.documents[index].reference.path))
//         .where((element) => element.submission != null)
//         .toList();
//   }
// }

// class SubmissionWithExPath {
//   final Submission submission;
//   final String exercisePath;
//   final DocumentSnapshot snapshot;
//   SubmissionWithExPath({
//     @required this.submission,
//     @required this.exercisePath,
//     @required this.snapshot,
//   });
// }
