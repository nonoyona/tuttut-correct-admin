import 'package:correct/pages/correct_submission/submission_logic.dart';
import 'package:correct/pages/correct_submission/task_tile.dart';
import 'package:correct/utils/style.dart';
import 'package:flutter/material.dart';

class SubmissionTaskView extends StatelessWidget {
  final int taskId;
  const SubmissionTaskView({Key key, @required this.taskId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logic = SubmissionLogic.of(context);
    return ListView(
      children: _buildList(context, logic),
    );
  }

  List<Widget> _buildList(BuildContext context, SubmissionLogic snapshot) {
    List<Widget> list = [];
    var tasks = snapshot.exercise.tasks[taskId].parts ?? [null];
    list.add(VotedTile(taskId: taskId));
    for (var i = 0; i < tasks.length; i++) {
      list.add(TaskTile(
        taskId: taskId,
        partName: tasks[i],
      ));
    }
    return list;
  }
}

class VotedTile extends StatelessWidget {
  final int taskId;
  const VotedTile({Key key, @required this.taskId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logic = SubmissionLogic.of(context);
    return Padding(
      padding: EdgeInsets.all(Style.smallPadding),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(Style.smallPadding),
              child: Text(
                "Voted by",
                style: Style.title,
              ),
            ),
            ..._buildList(logic),
          ],
        ),
      ),
    );
  }

  List<ListTile> _buildList(SubmissionLogic logic) {
    return logic.submission.contributors
        .map(
          (e) => ListTile(
            title: Text(e),
            dense: true,
            onTap: () => logic.addVoting(taskId, e),
            selected: logic.isVotedBy(taskId, e),
          ),
        )
        .toList();
  }
}
