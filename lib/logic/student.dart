import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@freezed
abstract class Student implements _$Student {
  const Student._();
  const factory Student(
      String name, String groupName, List<String> votingPoints, String id) = _Student;
  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
  factory Student.fromIdString(String e) {
    List<String> parts = e.split("(");
    String name = parts[0].trim();
    String group = "";
    if (parts.length > 1) {
      group = parts[1].substring(0, parts.length - 1).trim();
    }
    return Student(name, group, [], "");
  }

  String get idString => "$name ($groupName)";
}
