import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:correct/logic/auth_service.dart';
import 'package:correct/logic/student.dart';
import 'package:flutter/material.dart';

class UserManagementLogic extends ChangeNotifier {
  final AuthService auth;
  bool loaded = false;
  List<Student> students;

  UserManagementLogic({this.auth}) {
    _initialize();
  }

  Future _initialize() async {
    var user = await auth.getUser();
    var docs = await Firestore.instance
        .collection("${user.uid}/students/list")
        .getDocuments();
    students = docs.documents.map((e) => Student.fromJson(e.data)).toList();
    loaded = true;
    notifyListeners();
  }
}
