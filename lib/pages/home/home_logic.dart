// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:correct/logic/services/auth_service.dart';
// import 'package:flutter/material.dart';

// class HomeLogic extends ChangeNotifier {
//   final Firestore firestore = Firestore.instance;
//   final AuthService auth;

//   StreamSubscription _subscription;

//   List<_ExerciseWithPath> exercises = [];
//   String name = "";
//   bool loggedOut = false;

//   HomeLogic(this.auth) {
//     _init();
//   }

//   Future _init() async {
//     var user = await auth.getUser();
//     if (user == null) {
//       print("ERROR");
//       return;
//     }
//     name = user.displayName ?? "Anonymous";
//     _subscription =
//         firestore.collection("${user.uid}").snapshots().listen((event) {
//       exercises = event.documents
//           .map((e) =>
//               _ExerciseWithPath(Exercise.fromJson(e.data), e.reference.path))
//           .toList();
//       exercises.sort((a, b) => a.exercise.name.compareTo(b.exercise.name));
//       notifyListeners();
//     });
//   }

//   void logout() async {
//     await auth.signOut();
//     await Future.delayed(Duration(milliseconds: 100));
//     loggedOut = true;
//     notifyListeners();
//   }

//   @override
//   void dispose() {
//     _subscription?.cancel();
//     super.dispose();
//   }
// }

// class _ExerciseWithPath {
//   final Exercise exercise;
//   final String exercisePath;

//   _ExerciseWithPath(this.exercise, this.exercisePath);
// }
