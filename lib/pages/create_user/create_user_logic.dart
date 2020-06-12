import 'dart:math';

import 'package:flutter/material.dart';

class CreateUserLogic extends ChangeNotifier{
  TextEditingController nameController = TextEditingController();
  TextEditingController groupController = TextEditingController();
  TextEditingController idController = TextEditingController();

  generateId(){
    var random = Random().nextInt(8999999) + 1000000;
    idController.text = random.toString();
    notifyListeners();
  }

}