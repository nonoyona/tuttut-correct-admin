import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:correct/logic/auth_service.dart';
import 'package:correct/logic/exercise.dart';
import 'package:correct/logic/student.dart';
import 'package:correct/logic/submission.dart';
import 'package:flutter/material.dart';

class UserProfileLogic extends ChangeNotifier {
  final Student student;
  final AuthService _auth;
  var loaded = false;
  List<SubmissionWithExPath> submissions;

  double get allPoints => submissions.fold(
      0,
      (previousValue, element) =>
          previousValue + element.submission.currentPoints);
  double get allMaxPoints => submissions.fold(
      0,
      (previousValue, element) =>
          previousValue + element.submission.maximumPoints);
  double get allVotingPoints => submissions.fold(
      0,
      (previousValue, element) =>
          previousValue + element.submission.getVotingPoints(student.idString));
  double get allVotingPointsOverHalf => submissions.fold(
      0,
      (previousValue, element) =>
          previousValue +
          element.submission.getVotingPointsOverHalf(student.idString));
  double get totalTaskCount => submissions.fold(0,
      (previousValue, element) => previousValue + element.submission.taskCount);

  UserProfileLogic(this.student, this._auth) {
    if (this.student == null) return;
    fetchAllSubmissions();
  }

  Future fetchAllSubmissions() async {
    this.submissions = await student.fetchAllSubmissionsWithExPath(this._auth);
    this
        .submissions
        .sort((a, b) => a.submission.name.compareTo(b.submission.name));
    this.loaded = true;
    notifyListeners();
  }
}
