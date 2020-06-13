import 'dart:math';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:correct/logic/student.dart';
import 'package:flutter/material.dart';

class CreateUserLogic extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController groupController = TextEditingController();
  TextEditingController idController = TextEditingController();

  CreateUserState _state = CreateUserState.NONE;

  CreateUserState get state => _state;

  void generateId() {
    var random = Random().nextInt(8999999) + 1000000;
    idController.text = random.toString();
    notifyListeners();
  }

  Future addStudent() async {
    _state = CreateUserState.LOADING;
    notifyListeners();
    try {
      var callable =
          CloudFunctions.instance.getHttpsCallable(functionName: "addStudent");
      var user = new Student(
          nameController.text, groupController.text, [], idController.text);
      var result = await callable.call(user.toJson());
      if (result.data["status"] == 200) {
        _state = CreateUserState.SUCCESS;
      } else {
        _state = CreateUserState.FALIURE;
      }
    } catch (e) {
      _state = CreateUserState.FALIURE;
    } finally {
      notifyListeners();
    }
  }
}

enum CreateUserState { LOADING, SUCCESS, FALIURE, NONE }
