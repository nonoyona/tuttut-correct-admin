import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
abstract class Task implements _$Task{
  const Task._();
  const factory Task({@required String name, @required int points, @required int uid, List<String> parts}) = _Task;
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

extension TaskExt on Task{

}