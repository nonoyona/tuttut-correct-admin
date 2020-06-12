import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:correct/logic/auth_service.dart';
import 'package:correct/logic/exercise.dart';
import 'package:correct/logic/student.dart';
import 'package:correct/logic/submission.dart';
import 'package:correct/logic/task_note.dart';
import 'package:correct/logic/task_submission.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubmissionLogic extends ChangeNotifier {
  Submission submission;
  Exercise exercise;
  DocumentReference _reference;
  List<List<TaskNote>> _proposedNotes;
  List<Student> _students;
  List<Student> get students => _students;
  final String _exercisePath;
  bool saved = false;
  AuthService _auth;

  SubmissionLogic(this._exercisePath, this._auth, DocumentSnapshot submission) {
    if (submission != null) {
      _reference = submission.reference;
    }
    _init();
  }

  Future<bool> _initSubmission() async {
    if (_exercisePath == null) return false;
    var doc = await Firestore.instance.document(_exercisePath).get();
    exercise = Exercise.fromJson(doc.data);
    if (_reference != null) {
      var doc = await _reference.get();
      submission = Submission.fromJson(doc.data);
    } else {
      submission = Submission(
        exercise.tasks
            .map(
              (e) => TaskSubmission(e.name, e.points, [], []),
            )
            .toList(),
        [],
        exercise.name,
      );
    }
    return true;
  }

  Future<void> _initHelper() async {
    var snapshot = await Firestore.instance
        .collection("$_exercisePath/submissions")
        .getDocuments();
    var submissions =
        snapshot.documents.map((e) => Submission.fromJson(e.data)).toList();
    _proposedNotes = [];
    for (var i = 0; i < this.submission.tasks.length; i++) {
      var list = submissions
          .map((e) => e.tasks[i].notes)
          .fold<List<TaskNote>>([], (prev, element) => prev..addAll(element));
      List<_TaskNoteWithRanking> rankedList = [];
      for (var item in list) {
        var itemInList = rankedList.firstWhere(
          (element) =>
              element.note.comment == item.comment &&
              element.note.penalty == item.penalty,
          orElse: () => null,
        );
        if (itemInList == null) {
          rankedList.add(_TaskNoteWithRanking(item, 1));
        } else {
          itemInList.ranking++;
        }
      }

      _proposedNotes.add(
        (rankedList..sort((a, b) => -a.ranking.compareTo(b.ranking)))
            .map((e) => e.note)
            .toList(),
      );
    }
  }

  Future<void> _initStudentList() async {
    var user = await _auth.getUser();
    _students = (await Firestore.instance
            .collection("${user.uid}/students/list")
            .getDocuments())
        .documents
        .map((e) => Student.fromJson(e.data))
        .toList();
    _students = List.unmodifiable(_students);
  }

  Future<void> _init() async {
    bool success = await _initSubmission();
    if (!success) return;
    await _initHelper();
    await _initStudentList();
    notifyListeners();
  }

  void addNote(int index, String part) {
    if (submission == null) return;
    submission.tasks[index].notes
        .add(TaskNote("", 0, Random().nextInt(pow(2, 20)), part));
    notifyListeners();
  }

  void addPredefinedNote(int index, TaskNote note) {
    if (submission == null) return;
    submission.tasks[index].notes
        .add(note.copyWith.call(uid: Random().nextInt(pow(2, 20))));
    notifyListeners();
  }

  void removeNote(int taskIndex, int noteIndex, String part) {
    if (submission == null) return;
    var p = submission.tasks[taskIndex].notes
        .where((element) => element.part == part)
        .toList()[noteIndex];
    submission.tasks[taskIndex].notes.remove(p);
    notifyListeners();
  }

  Future<void> addContributor(Student student) async {
    if (submission == null) return;
    submission.contributors.add("${student.name} (${student.groupName})");
    notifyListeners();
    var user = await _auth.getUser();
    var docs = await Firestore.instance
        .collection("${user.uid}/students/list")
        .where("name", isEqualTo: student.name)
        .where("groupName", isEqualTo: student.groupName)
        .getDocuments();
    if (docs.documents.length == 0) {
      await Firestore.instance
          .collection("${user.uid}/students/list")
          .add(student.toJson());
    }
  }

  void removeContributor(int index) {
    if (submission == null) return;
    submission.contributors.removeAt(index);
    notifyListeners();
  }

  Future save() async {
    print("saving");
    if (submission == null) return;
    if (_reference == null) {
      print("need to create new");
      await Firestore.instance
          .collection("$_exercisePath/submissions")
          .add(submission.toJson());
    } else {
      print("updating old");
      await _reference.setData(submission.toJson());
    }
    saved = true;
    notifyListeners();
  }

  void editNote(int taskIndex, int noteIndex, String comment, double penalty,
      String part) {
    if (submission == null) return;
    var note = submission.tasks[taskIndex].notes
        .where((element) => element.part == part)
        .toList()[noteIndex];
    var index = submission.tasks[taskIndex].notes.indexOf(note);
    submission.tasks[taskIndex].notes[index] =
        note.copyWith.call(comment: comment, penalty: penalty);
    notifyListeners();
  }

  List<TaskNote> getProposedNotes(int taskIndex) {
    return _proposedNotes[taskIndex]
        .where((e) => submission.tasks[taskIndex].notes
            .every((se) => se.comment != e.comment || se.penalty != e.penalty))
        .toList();
  }

  static SubmissionLogic of(BuildContext context, {bool listen = true}) =>
      Provider.of<SubmissionLogic>(context, listen: listen);

  void addVoting(int taskId, String contributor) {
    var tasks = submission.tasks;
    var task = tasks[taskId];
    var voters = task.votedBy ?? [];
    if (voters.contains(contributor)) {
      voters.remove(contributor);
    } else {
      voters.add(contributor);
    }
    task = task.copyWith.call(votedBy: voters);
    tasks[taskId] = task;
    submission = submission.copyWith.call(tasks: tasks);
    notifyListeners();
  }

  bool isVotedBy(int taskId, String contributor) {
    if (submission == null) return false;
    return submission.tasks[taskId].votedBy?.contains(contributor) ?? false;
  }
}

class _TaskNoteWithRanking {
  final TaskNote note;
  int ranking;

  _TaskNoteWithRanking(this.note, this.ranking);
}
