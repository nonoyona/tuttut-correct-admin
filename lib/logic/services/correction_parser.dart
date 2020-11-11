import 'package:correct/logic/dataobjects/points.dart';
import 'package:flutter/foundation.dart';

class CorrectionParser {
  final String correction;
  CorrectionParser({
    @required this.correction,
  });

  List<TaskInfo> getTaskInfos() {
    final lines = correction.split("\n");
    List<TaskInfo> infos = [];
    String currentName;
    var currentReached = 0;
    var currentReachable = 0;
    for (var line in lines) {
      if (line.startsWith("#")) {
        _addIfNewParagraphDetected(
            currentName, currentReached, currentReachable, infos);
        currentReached = 0;
        currentReachable = 0;
        currentName = line.split("[")[0].replaceAll("#", "").trim();
      }
      final points = _getPoints(line);
      currentReached += points.reached;
      currentReachable += points.reachable ?? 0;
    }
    _addIfNewParagraphDetected(
        currentName, currentReached, currentReachable, infos);
    return infos;
  }

  Points getPoints() => _getPoints(this.correction);

  void _addIfNewParagraphDetected(String currentName, int currentReached,
      int currentReachable, List<TaskInfo> infos) {
    if (currentName != null && (currentReached > 0 || currentReachable > 0)) {
      infos.add(
        TaskInfo(
          name: currentName,
          points: Points(
            reached: currentReached,
            reachable: currentReachable > 0 ? currentReachable : null,
          ),
        ),
      );
    }
  }

  Points _getPoints(String input) {
    var currentReached = 0;
    var currentReachable = 0;
    RegExp(r"\[\+[1-9][0-9]*\]").allMatches(input).forEach((element) {
      final matchString = element.group(0);
      final points =
          int.tryParse(matchString.substring(2, matchString.length - 1));
      currentReached += points ?? 0;
    });
    RegExp(r"\[-[1-9][0-9]*\]").allMatches(input).forEach((element) {
      final matchString = element.group(0);
      final points =
          int.tryParse(matchString.substring(2, matchString.length - 1));
      currentReached -= points ?? 0;
    });
    RegExp(r"\[[1-9][0-9]*/[1-9][0-9]*\]").allMatches(input).forEach((element) {
      final matchString = element.group(0);
      final pointString = matchString.substring(1, matchString.length - 1);
      final reached = int.tryParse(pointString.split("/")[0]);
      final reachable = int.tryParse(pointString.split("/")[1]);
      currentReached += reached ?? 0;
      currentReachable += reachable ?? 0;
    });
    return Points(
      reached: currentReached,
      reachable: currentReachable > 0 ? currentReachable : null,
    );
  }
}

class TaskInfo {
  final String name;
  final Points points;
  TaskInfo({
    @required this.name,
    @required this.points,
  });
}
