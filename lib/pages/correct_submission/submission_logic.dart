// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:correct/logic/services/auth_service.dart';
// import 'package:correct/logic/exercise.dart';
// import 'package:correct/logic/student.dart';
// import 'package:correct/logic/submission.dart';
// import 'package:correct/logic/task_note.dart';
// import 'package:correct/logic/task_submission.dart';
// import 'package:correct/pages/correct_submission/contributors_tile.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SubmissionLogic extends ChangeNotifier {
//   Submission submission;
//   Exercise exercise;
//   DocumentReference _reference;
//   List<List<TaskNote>> _proposedNotes;
//   List<Student> _students;
//   List<Student> _searchedStudents;
//   static List<StudentWithSubmissions> _studentsWithSubmissions;
//   List<Student> get students => _students;
//   List<Student> get searchedStudents => _searchedStudents ?? _students;
//   final String _exercisePath;
//   bool saved = false;
//   AuthService auth;

//   SubmissionLogic(this._exercisePath, this.auth, DocumentSnapshot submission) {
//     if (submission != null) {
//       _reference = submission.reference;
//     }
//     _init();
//   }

//   Future<bool> _initSubmission() async {
//     if (_exercisePath == null) return false;
//     var doc = await Firestore.instance.document(_exercisePath).get();
//     exercise = Exercise.fromJson(doc.data);
//     if (_reference != null) {
//       var doc = await _reference.get();
//       submission = Submission.fromJson(doc.data);
//     } else {
//       submission = Submission(
//         exercise.tasks
//             .map(
//               (e) => TaskSubmission(e.name, e.points, [], []),
//             )
//             .toList(),
//         [],
//         exercise.name,
//       );
//     }
//     return true;
//   }

//   Future<void> _initHelper() async {
//     var snapshot = await Firestore.instance
//         .collection("$_exercisePath/submissions")
//         .getDocuments();
//     var submissions =
//         snapshot.documents.map((e) => Submission.fromJson(e.data)).toList();
//     _proposedNotes = [];
//     for (var i = 0; i < this.submission.tasks.length; i++) {
//       var list = submissions
//           .map((e) => e.tasks[i].notes)
//           .fold<List<TaskNote>>([], (prev, element) => prev..addAll(element));
//       List<_TaskNoteWithRanking> rankedList = [];
//       for (var item in list) {
//         var itemInList = rankedList.firstWhere(
//           (element) =>
//               element.note.comment == item.comment &&
//               element.note.penalty == item.penalty,
//           orElse: () => null,
//         );
//         if (itemInList == null) {
//           rankedList.add(_TaskNoteWithRanking(item, 1));
//         } else {
//           itemInList.ranking++;
//         }
//       }

//       _proposedNotes.add(
//         (rankedList..sort((a, b) => -a.ranking.compareTo(b.ranking)))
//             .map((e) => e.note)
//             .toList(),
//       );
//     }
//   }

//   void search(String text) {
//     var textParts = text.split(RegExp(r"[,;._$!=/]"));
//     var group = textParts.length > 1 ? textParts[1] : "No Group";
//     var name = textParts[0].trim();
//     List<Student> list = [];
//     list.addAll(students.where((element) =>
//         element.name.toLowerCase().contains(name.toLowerCase()) ||
//         element.groupName.toLowerCase().contains(group.toLowerCase()) ||
//         text.toLowerCase().contains(element.name.toLowerCase()) ||
//         text.toLowerCase().contains(element.groupName.toLowerCase())));
//     list.removeWhere((element) => submission.contributors.any((c) {
//           return c == "${element.name} (${element.groupName})";
//         }));

//     _searchedStudents = list;
//     notifyListeners();
//   }

//   Future<void> _initStudentList() async {
//     var user = await auth.getUser();
//     var list = (await Firestore.instance
//             .collection("${user.uid}/students/list")
//             .getDocuments())
//         .documents
//         .map((e) => Student.fromJson(e.data))
//         .toList();
//     List<String> studentsWithSubmission = (await Firestore.instance
//             .collection("${_exercisePath}/submissions")
//             .getDocuments())
//         .documents
//         .where((element) =>
//             element.reference.documentID != (_reference?.documentID ?? ""))
//         .map((e) => Submission.fromJson(e.data).contributors)
//         .fold(<String>[],
//             (previousValue, element) => previousValue..addAll(element));
//     list.removeWhere(
//         (element) => studentsWithSubmission.contains(element.idString));

//     if (submission.contributors.isNotEmpty) {
//       print("LOADING");
//       if (_studentsWithSubmissions == null) {
//         _studentsWithSubmissions = await Future.wait(list.map((e) async =>
//             StudentWithSubmissions(
//                 student: e, submissions: await e.fetchAllSubmissions(auth))));
//       }
//       var studentsWithSubmissions = List<StudentWithSubmissions>.from(_studentsWithSubmissions);
//       studentsWithSubmissions.sort((a, b) {
//         int valueForA = a.submissions.fold(
//             0,
//             (previousValue, element) =>
//                 previousValue +
//                 element.contributors
//                     .where(
//                         (element) => submission.contributors.contains(element))
//                     .length);
//         int valueForB = b.submissions.fold(
//             0,
//             (previousValue, element) =>
//                 previousValue +
//                 element.contributors
//                     .where(
//                         (element) => submission.contributors.contains(element))
//                     .length);
//         return -valueForA.compareTo(valueForB);
//       });
//       list = studentsWithSubmissions.map((e) => e.student).toList();
//       print("LOADED");
//     }
//     if (_studentsWithSubmissions == null) {
//       Future.wait(list.map((e) async => StudentWithSubmissions(
//           student: e,
//           submissions: await e.fetchAllSubmissions(auth)))).then((value) {
//         _studentsWithSubmissions = value;
//         _students = List.unmodifiable(list);
//       });
//     }
//     _students = List.unmodifiable(list);
//   }

//   Future<void> _init() async {
//     bool success = await _initSubmission();
//     if (!success) return;
//     await _initHelper();
//     await _initStudentList();
//     notifyListeners();
//   }

//   void addNote(int index, String part) {
//     if (submission == null) return;
//     submission.tasks[index].notes
//         .add(TaskNote("", 0, Random().nextInt(pow(2, 20)), part));
//     notifyListeners();
//   }

//   void addPredefinedNote(int index, TaskNote note) {
//     if (submission == null) return;
//     submission.tasks[index].notes
//         .add(note.copyWith.call(uid: Random().nextInt(pow(2, 20))));
//     notifyListeners();
//   }

//   void removeNote(int taskIndex, int noteIndex, String part) {
//     if (submission == null) return;
//     var p = submission.tasks[taskIndex].notes
//         .where((element) => element.part == part)
//         .toList()[noteIndex];
//     submission.tasks[taskIndex].notes.remove(p);
//     notifyListeners();
//   }

//   Future<void> addContributor(Student student) async {
//     if (submission == null) return;
//     submission.contributors.add("${student.name} (${student.groupName})");
//     notifyListeners();
//     await _initStudentList();
//     notifyListeners();
//   }

//   void removeContributor(int index) async {
//     if (submission == null) return;
//     submission.contributors.removeAt(index);
//     notifyListeners();
//     await _initStudentList();
//     notifyListeners();
//   }

//   Future save() async {
//     print("saving");
//     if (submission == null) return;
//     if (_reference == null) {
//       print("need to create new");
//       await Firestore.instance
//           .collection("$_exercisePath/submissions")
//           .add(submission.toJson());
//     } else {
//       print("updating old");
//       await _reference.setData(submission.toJson());
//     }
//     saved = true;
//     notifyListeners();
//   }

//   void editNote(int taskIndex, int noteIndex, String comment, double penalty,
//       String part) {
//     if (submission == null) return;
//     var note = submission.tasks[taskIndex].notes
//         .where((element) => element.part == part)
//         .toList()[noteIndex];
//     var index = submission.tasks[taskIndex].notes.indexOf(note);
//     submission.tasks[taskIndex].notes[index] =
//         note.copyWith.call(comment: comment, penalty: penalty);
//     notifyListeners();
//   }

//   List<TaskNote> getProposedNotes(int taskIndex) {
//     return _proposedNotes[taskIndex]
//         .where((e) => submission.tasks[taskIndex].notes
//             .every((se) => se.comment != e.comment || se.penalty != e.penalty))
//         .toList();
//   }

//   static SubmissionLogic of(BuildContext context, {bool listen = true}) =>
//       Provider.of<SubmissionLogic>(context, listen: listen);

//   void addVoting(int taskId, String contributor) {
//     var tasks = submission.tasks;
//     var task = tasks[taskId];
//     var voters = task.votedBy ?? [];
//     if (voters.contains(contributor)) {
//       voters.remove(contributor);
//     } else {
//       voters.add(contributor);
//     }
//     task = task.copyWith.call(votedBy: voters);
//     tasks[taskId] = task;
//     submission = submission.copyWith.call(tasks: tasks);
//     notifyListeners();
//   }

//   bool isVotedBy(int taskId, String contributor) {
//     if (submission == null) return false;
//     return submission.tasks[taskId].votedBy?.contains(contributor) ?? false;
//   }

//   void resetSearch() {
//     _searchedStudents = null;
//   }
// }

// class _TaskNoteWithRanking {
//   final TaskNote note;
//   int ranking;

//   _TaskNoteWithRanking(this.note, this.ranking);
// }
