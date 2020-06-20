import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:correct/logic/auth_service.dart';
import 'package:correct/logic/student.dart';
import 'package:flutter/material.dart';
import 'package:correct/utils/list_methods.dart';

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
        .snapshots();
    docs.listen((event) {
      students = event.documents.map((e) => Student.fromJson(e.data)).toList();
      students.sort((a, b) => a.name.compareTo(b.name));
      students.stableSort((a, b) => a.groupName.compareTo(b.groupName));
      loaded = true;
      notifyListeners();
    });
  }
}
