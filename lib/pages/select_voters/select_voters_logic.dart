// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:correct/logic/services/auth_service.dart';
// import 'package:correct/logic/exercise.dart';
// import 'package:correct/utils/list_methods.dart';
// import 'package:flutter/material.dart';

// import 'package:correct/logic/student.dart';
// import 'package:correct/logic/submission.dart';
// import 'package:provider/provider.dart';

// class SelectVotersLogic extends ChangeNotifier {
//   List<_Contributor> _contributors = [];
//   Exercise exercise;
//   AuthService _authService;
//   bool loaded = false;
//   SelectVotersLogic(
//       this._authService, List<Submission> submissions, this.exercise) {
//     if (submissions == null || this.exercise == null) {
//     } else {
//       _init(submissions);
//     }
//   }

//   Future _init(List<Submission> submissions) async {
//     var user = await _authService.getUser();
//     var uid = user.uid;
//     var documentSnapshot = await Firestore.instance
//         .collection("$uid/students/list")
//         .getDocuments();
//     var students =
//         documentSnapshot.documents.map((e) => Student.fromJson(e.data));
//     for (var submission in submissions) {
//       for (var contributor in submission.contributors) {
//         var st = students.firstWhere(
//           (element) => element.idString == contributor,
//           orElse: () => null,
//         );
//         if (st != null) {
//           _contributors.add(_Contributor(student: st, submission: submission));
//         }
//       }
//     }
//     loaded = true;
//     notifyListeners();
//   }

//   List<_Contributor> getVoters(int taskId) {
//     if (!loaded) return [];
//     return _contributors
//         .where((element) => element.submission.tasks[taskId].votedBy
//             .contains(element.student.idString))
//         .toList()
//           ..stableSort((a, b) => a.student.name.compareTo(b.student.name))
//           ..stableSort((a, b) => -a.submission.tasks[taskId].currentPoints
//               .compareTo(b.submission.tasks[taskId].currentPoints))
//           ..stableSort((a, b) => a.student.votingPoints.length
//               .compareTo(b.student.votingPoints.length));
//   }

//   Future _selectForPrecalculation(int taskId, _Contributor contributor) async {
//     var votingPoints = contributor.student.votingPoints;
//     votingPoints.add("${exercise.name};$taskId");
//     var student = contributor.student.copyWith.call(votingPoints: votingPoints);
//     _contributors.remove(contributor);
//     _contributors.add(contributor.copyWith(student: student));
//     notifyListeners();
//     var user = await _authService.getUser();
//     var uid = user.uid;
//     var documentSnapshot = await Firestore.instance
//         .collection("$uid/students/list")
//         .where("name", isEqualTo: contributor.student.name)
//         .where("groupName", isEqualTo: contributor.student.groupName)
//         .getDocuments();
//     var doc = documentSnapshot.documents.first;
//     await doc.reference.updateData(student.toJson());
//   }

//   Future _unselectForPrecalculation(
//       int taskId, _Contributor contributor) async {
//     var votingPoints = contributor.student.votingPoints;
//     votingPoints.remove("${exercise.name};$taskId");
//     var student = contributor.student.copyWith.call(votingPoints: votingPoints);
//     _contributors.remove(contributor);
//     _contributors.add(contributor.copyWith(student: student));
//     notifyListeners();
//     var user = await _authService.getUser();
//     var uid = user.uid;
//     var documentSnapshot = await Firestore.instance
//         .collection("$uid/students/list")
//         .where("name", isEqualTo: contributor.student.name)
//         .where("groupName", isEqualTo: contributor.student.groupName)
//         .getDocuments();
//     var doc = documentSnapshot.documents.first;
//     await doc.reference.updateData(student.toJson());
//   }

//   Future togglePrecalculation(int taskId, _Contributor contributor) async {
//     if (contributor.student.votingPoints.contains("${exercise.name};$taskId")) {
//       await _unselectForPrecalculation(taskId, contributor);
//     } else {
//       await _selectForPrecalculation(taskId, contributor);
//     }
//   }

//   static SelectVotersLogic of(BuildContext context, {bool listen = true}) =>
//       Provider.of<SelectVotersLogic>(context, listen: listen);
// }

// class _Contributor {
//   final Student student;
//   final Submission submission;
//   _Contributor({
//     @required this.student,
//     @required this.submission,
//   });

//   _Contributor copyWith({
//     Student student,
//     Submission submission,
//   }) {
//     return _Contributor(
//       student: student ?? this.student,
//       submission: submission ?? this.submission,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'student': student.toJson(),
//       'submission': submission.toJson(),
//     };
//   }

//   static _Contributor fromMap(Map<String, dynamic> map) {
//     if (map == null) return null;

//     return _Contributor(
//       student: Student.fromJson(map['student']),
//       submission: Submission.fromJson(map['submission']),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   static _Contributor fromJson(String source) => fromMap(json.decode(source));

//   @override
//   String toString() =>
//       '_Contributor(student: $student, submission: $submission)';

//   @override
//   bool operator ==(Object o) {
//     if (identical(this, o)) return true;

//     return o is _Contributor &&
//         o.student == student &&
//         o.submission == submission;
//   }

//   @override
//   int get hashCode => student.hashCode ^ submission.hashCode;
// }
