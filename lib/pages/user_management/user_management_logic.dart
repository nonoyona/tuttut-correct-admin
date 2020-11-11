// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:correct/logic/services/auth_service.dart';
// import 'package:correct/logic/student.dart';
// import 'package:correct/logic/submission.dart';
// import 'package:correct/utils/list_methods.dart';
// import 'package:flutter/material.dart';

// class UserManagementLogic extends ChangeNotifier {
//   final AuthService auth;
//   bool loaded = false;
//   List<Student> students;
//   List<Submission> submissions;

//   UserManagementLogic({this.auth}) {
//     _initialize();
//   }

//   Future _initialize() async {
//     var user = await auth.getUser();
//     await _fetchAllSubmissions();
//     var docs =
//         Firestore.instance.collection("${user.uid}/students/list").snapshots();
//     docs.listen((event) {
//       students = event.documents.map((e) => Student.fromJson(e.data)).toList();
//       students.sort((a, b) => a.name.compareTo(b.name));
//       students.stableSort((a, b) => a.groupName.compareTo(b.groupName));
//       loaded = true;
//       notifyListeners();
//     });
//   }

//   Future _fetchAllSubmissions() async {
//     var user = await auth.getUser();
//     var exercises =
//         await Firestore.instance.collection("${user.uid}").getDocuments();
//     var submissionQueries = exercises.documents.map((e) => Firestore.instance
//         .collection("${user.uid}/${e.documentID}/submissions")
//         .getDocuments());
//     List<Submission> submissions = (await Future.wait(submissionQueries)).fold(
//         [],
//         (previousValue, element) => previousValue
//           ..addAll(element.documents.map((e) => Submission.fromJson(e.data))));
//     this.submissions = submissions;
//   }

//   StudentInfo getStudentInfo(Student student) {
//     var submissions = this
//         .submissions
//         .where((element) =>
//             element?.contributors?.contains(student.idString) ?? false)
//         .toList();
//     double reachedPoints = submissions.fold(
//         0, (previousValue, element) => previousValue + element.currentPoints);
//     int votingPoints = submissions.fold(
//         0,
//         (previousValue, element) =>
//             previousValue + element.getVotingPoints(student.idString));
//     int votingPointsOverHalf = submissions.fold(
//         0,
//         (previousValue, element) =>
//             previousValue + element.getVotingPointsOverHalf(student.idString));
//     return StudentInfo(
//         reachedPoints: reachedPoints,
//         votingPoints: votingPoints,
//         votingPointsOverHalf: votingPointsOverHalf);
//   }

//   Future changePassed(Student student, bool value) async {
//     var user = await auth.getUser();
//     var docs = await Firestore.instance
//         .collection("${user.uid}/students/list")
//         .where("id", isEqualTo: student.id)
//         .getDocuments();
//     if (docs.documents.length > 0) {
//       await docs.documents[0].reference.updateData({"passed": value});
//     }
//   }
// }

// class StudentInfo {
//   final double reachedPoints;
//   final int votingPoints;
//   final int votingPointsOverHalf;
//   StudentInfo({
//     @required this.reachedPoints,
//     @required this.votingPoints,
//     @required this.votingPointsOverHalf,
//   });
// }
