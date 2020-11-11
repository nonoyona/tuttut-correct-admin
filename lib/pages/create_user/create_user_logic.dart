import 'dart:math';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:correct/logic/dataobjects/student_info.dart';
import 'package:correct/logic/services/api_service.dart';
import 'package:correct/logic/services/student_service.dart';
import 'package:correct/logic/student.dart';
import 'package:flutter/material.dart';

class CreateUserLogic extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();

  CreateUserState _state = CreateUserState.NONE;

  CreateUserState get state => _state;

  final String groupId;
  CreateUserLogic({
    @required this.groupId,
  });

  void generateId() {
    var random = Random().nextInt(8999999) + 1000000;
    idController.text = random.toString();
    notifyListeners();
  }

  Future addStudent() async {
    if (nameController.text.isEmpty || idController.text.isEmpty) {
      _state = CreateUserState.FALIURE;
      notifyListeners();
      return;
    }
    _state = CreateUserState.LOADING;
    notifyListeners();
    final result = await StudentService.instance
        .createStudent(nameController.text, idController.text, groupId);
    if (result) {
      _state = CreateUserState.SUCCESS;
    } else {
      _state = CreateUserState.FALIURE;
    }
    notifyListeners();
  }
}

enum CreateUserState { LOADING, SUCCESS, FALIURE, NONE }
