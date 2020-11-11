// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_functions/cloud_functions.dart';
// import 'package:correct/logic/pdf_repository.dart';
// import 'package:correct/logic/submission.dart';
// import 'package:correct/pages/correct_exercise/file_selection_repository.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class ExerciseLogic extends ChangeNotifier {
//   // final Firestore firestore = Firestore.instance;
//   // final String exercisePath;
//   // final FileSelectionRepository _repository = FileSelectionRepository();

//   // List<_SubmissionDocument> submissions = [];

//   // ExerciseLogic(this.exercise, this.exercisePath) {
//   //   if (this.exercise == null || this.exercisePath == null) return;
//   //   _init();
//   // }

//   // Future _init() async {
//   //   firestore
//   //       .collection("${this.exercisePath}/submissions")
//   //       .snapshots()
//   //       .listen((event) {
//   //     submissions = event.documents
//   //         .map((e) => _SubmissionDocument(Submission.fromJson(e.data), e))
//   //         .toList();
//   //     submissions.sort((a, b) => (a.submission.contributors..sort())
//   //         .first
//   //         .compareTo((b.submission.contributors..sort()).first));
//   //     notifyListeners();
//   //   });
//   // }

//   // Future publish() {
//   //   this.exercise =
//   //       this.exercise.copyWith.call(published: !this.exercise.published);
//   //   notifyListeners();
//   //   return firestore.document(this.exercisePath).updateData({
//   //     "published": exercise.published,
//   //   });
//   // }

//   // Future<bool> importFiles() async {
//   //   var result = await _repository.selectFile();
//   //   var success = true;
//   //   for (var i = 0; i < result.filenames.length; i++) {
//   //     var callable = CloudFunctions.instance
//   //         .getHttpsCallable(functionName: "extractSubmission");
//   //     var filename = result.filenames[i];
//   //     var data = result.data[i];
//   //     if (!filename.startsWith("Ex_") || !filename.endsWith(".md")) {
//   //       success = false;
//   //       continue;
//   //     }
//   //     var contributors = filename.split(".")[0].split("_").sublist(1);
//   //     var subDocs = submissions.where((element) =>
//   //         listEquals(element.submission.contributors, contributors));
//   //     if (subDocs.isEmpty) {
//   //       success = false;
//   //       continue;
//   //     }
//   //     var subDoc = subDocs.first;
//   //     var res = await callable.call({
//   //       "markdown": data,
//   //       "contributors": contributors,
//   //       "path": subDoc.document.reference.path
//   //     });
//   //     print(res.data);
//   //     if (res.data["status"] != 200) {
//   //       success = false;
//   //     }
//   //   }
//   //   return success;
//   // }

//   // Future createTemplates() async {
//   //   var filenames = this
//   //       .submissions
//   //       .map((e) => "Ex_${e.submission.contributors.join("_")}.md")
//   //       .toList();
//   //   var taskHeaders =
//   //       exercise.tasks.map((e) => "## ${e.name}:${e.points}:").join("\n");
//   //   var template = "## ${exercise.name}\n$taskHeaders";
//   //   var downloader = PdfRepository();
//   //   var fileData =
//   //       downloader.zipFiles(filenames, List.filled(filenames.length, template));
//   //   downloader.downloadFile(fileData, "${exercise.name}.tar.bz");
//   // }
// }

// class _SubmissionDocument {
//   final Submission submission;
//   final DocumentSnapshot document;

//   _SubmissionDocument(this.submission, this.document);
// }
