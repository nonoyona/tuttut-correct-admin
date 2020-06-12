import 'package:correct/pages/select_voters/select_voters_logic.dart';
import 'package:flutter/material.dart';

class SelectVotersTab extends StatelessWidget {
  final int taskId;
  const SelectVotersTab({Key key, @required this.taskId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logic = SelectVotersLogic.of(context);
    var voters = logic.getVoters(taskId);
    var tiles = <Widget>[];
    for (var e in voters) {
      var selected =
          e.student.votingPoints.contains("${logic.exercise.name};$taskId");
      if (selected) {
        tiles.insert(
          0,
          ListTile(
            title: Text(e.student.idString),
            subtitle: Text("${e.student.votingPoints.length} Voting Points"),
            trailing: Text("${e.submission.tasks[taskId].currentPoints}pts"),
            selected: selected,
            onTap: () => logic.togglePrecalculation(taskId, e),
          ),
        );
      } else {
        tiles.add(
          ListTile(
            title: Text(e.student.idString),
            subtitle: Text("${e.student.votingPoints.length} Voting Points"),
            trailing: Text("${e.submission.tasks[taskId].currentPoints}pts"),
            selected: selected,
            onTap: () => logic.togglePrecalculation(taskId, e),
          ),
        );
      }
    }
    return ListView(
      children: tiles,
    );
  }
}
