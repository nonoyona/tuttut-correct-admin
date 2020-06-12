import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:correct/logic/exercise.dart';
import 'package:correct/logic/pdf_repository.dart';
import 'package:correct/logic/submission.dart';
import 'package:flutter/material.dart';

class ExerciseLogic extends ChangeNotifier {
  final Firestore firestore = Firestore.instance;
  Exercise exercise;
  final String exercisePath;
  final PdfRepository _repository = PdfRepository();

  List<_SubmissionDocument> submissions = [];

  ExerciseLogic(this.exercise, this.exercisePath) {
    if (this.exercise == null || this.exercisePath == null) return;
    _init();
  }

  Future _init() async {
    firestore
        .collection("${this.exercisePath}/submissions")
        .snapshots()
        .listen((event) {
      submissions = event.documents
          .map((e) => _SubmissionDocument(Submission.fromJson(e.data), e))
          .toList();
      notifyListeners();
    });
  }

  void export() async {
    if (submissions.isEmpty) return;
    var zip = await _repository
        .exportSubmissions(submissions.map((e) => e.submission).toList());
    _repository.downloadFile(zip, "${exercise.name}.tar.bz");
  }

  Future publish() {
    this.exercise =
        this.exercise.copyWith.call(published: !this.exercise.published);
    notifyListeners();
    return firestore.document(this.exercisePath).updateData({
      "published": exercise.published,
    });
  }
}

class _SubmissionDocument {
  final Submission submission;
  final DocumentSnapshot document;

  _SubmissionDocument(this.submission, this.document);
}
