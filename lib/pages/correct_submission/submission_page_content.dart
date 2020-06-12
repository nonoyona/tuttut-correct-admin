import 'package:correct/hooks/tab_controller_hook.dart';
import 'package:correct/logic/task_submission.dart';
import 'package:correct/pages/correct_submission/contributors_tile.dart';
import 'package:correct/pages/correct_submission/submission_header.dart';
import 'package:correct/pages/correct_submission/submission_logic.dart';
import 'package:correct/pages/correct_submission/submission_task_view.dart';
import 'package:correct/pages/correct_submission/task_tile.dart';
import 'package:correct/widgets/responsive_constrained_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SubmissionPageContent extends StatefulWidget {
  SubmissionPageContent({Key key}) : super(key: key);

  @override
  _SubmissionPageContentState createState() => _SubmissionPageContentState();
}

class _SubmissionPageContentState extends State<SubmissionPageContent> {
  @override
  Widget build(BuildContext context) {
    var snapshot = SubmissionLogic.of(context);
    return Scaffold(
      body: CenteredConstrainedBox(
        child: snapshot.submission == null
            ? _SubmissionContentNotLoaded()
            : _SubmissionContentLoaded(
                tasks: snapshot.submission.tasks,
              ),
      ),
    );
  }
}

class _SubmissionContentLoaded extends HookWidget {
  final List<TaskSubmission> tasks;
  _SubmissionContentLoaded({
    Key key,
    @required this.tasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = useTabController(tasks.length + 1);
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) =>
          [SubmissionHeader(controller: controller)],
      body: TabBarView(
        controller: controller,
        children: [
          ...tasks.mapIndexed(
            (element, index) => SubmissionTaskView(
              taskId: index,
            ),
          ),
          ContributorsTile(),
        ],
      ),
    );
  }


  
}

class _SubmissionContentNotLoaded extends StatelessWidget {
  const _SubmissionContentNotLoaded({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SubmissionHeaderNotLoaded(),
        SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
      ],
    );
  }
}
