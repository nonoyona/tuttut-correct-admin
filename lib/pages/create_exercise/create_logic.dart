import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:correct/logic/auth_service.dart';
import 'package:correct/logic/exercise.dart';
import 'package:correct/logic/task.dart';
import 'package:flutter/material.dart';

class CreateLogic extends ChangeNotifier {
  Exercise exercise = Exercise(
    name: "",
    tasks: [],
    published: false,
  );

  bool saved = false;
  final AuthService _auth;

  CreateLogic(this._auth);

  void changeExerciseName(String name) {
    exercise = exercise.copyWith.call(name: name);
    notifyListeners();
  }

  void addTask() {
    exercise = exercise.copyWith.call(
      tasks: exercise.tasks
        ..add(
          Task(name: "", points: 0, uid: Random().nextInt(pow(2, 20))),
        ),
    );
    notifyListeners();
  }

  Future save() async {
    print("saving");
    var user = await _auth.getUser();
    print("fetched user ${user?.uid}");
    await Firestore.instance.collection("${user.uid}").add(exercise.toJson());
    print("saved");
    saved = true;
    notifyListeners();
  }

  void changeTaskName(int index, String name) {
    var tasks = exercise.tasks;
    tasks[index] = tasks[index].copyWith.call(name: name);
    exercise = exercise.copyWith.call(tasks: tasks);
    notifyListeners();
  }

  void addParts(int index, List<String> parts){
    var tasks = exercise.tasks;
    tasks[index] = tasks[index].copyWith.call(parts: parts);
    exercise = exercise.copyWith.call(tasks: tasks);
    notifyListeners();
  }

  void changeTaskPoints(int index, int points) {
    var tasks = exercise.tasks;
    tasks[index] = tasks[index].copyWith.call(points: points);
    exercise = exercise.copyWith.call(tasks: tasks);
    notifyListeners();
  }

  void removeTask(int index) {
    var tasks = exercise.tasks;
    tasks.removeAt(index);
    exercise = exercise.copyWith.call(tasks: tasks);
    notifyListeners();
  }
}
