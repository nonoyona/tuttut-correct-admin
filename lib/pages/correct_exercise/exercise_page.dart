import 'package:correct/logic/exercise.dart';
import 'package:correct/pages/correct_exercise/exercise_logic.dart';
import 'package:correct/pages/correct_exercise/widget/create_submission_tile.dart';
import 'package:correct/pages/correct_exercise/widget/submission_tile.dart';
import 'package:correct/utils/style.dart';
import 'package:correct/widgets/link_button.dart';
import 'package:correct/widgets/notifier_provider_consumer.dart';
import 'package:correct/widgets/redirect_on_null.dart';
import 'package:correct/widgets/responsive_constrained_box.dart';
import 'package:flutter/material.dart';

class ExercisePage extends StatelessWidget {
  final Exercise exercise;
  final String exercisePath;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ExercisePage({Key key, @required this.exercise, @required this.exercisePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RedirectOnNull(
      objects: [exercise, exercisePath],
      child: NotifierProviderConsumer<ExerciseLogic>(
        create: (context) => ExerciseLogic(exercise, exercisePath),
        builder: (context, snapshot) {
          return Scaffold(
            key: _scaffoldKey,
            body: CenteredConstrainedBox(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    actions: <Widget>[
                      LinkButton(
                        onPressed: () => snapshot.createTemplates(),
                        label: "TEMPLATES",
                      ),
                      LinkButton(
                        onPressed: () async {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Uploading..."),
                            duration: Duration(hours: 2),
                          ));
                          var res = await snapshot.importFiles();
                          _scaffoldKey.currentState.hideCurrentSnackBar();
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text(
                                  res ? "Uploaded changes" : "Upload failed")));
                        },
                        label: "UPLOAD",
                      ),
                      LinkButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          "/home/exercise/voters",
                          arguments: {
                            "exercise": snapshot.exercise,
                            "submissions": snapshot.submissions
                                .map((e) => e.submission)
                                .toList(),
                          },
                        ),
                        label: "VOTERS",
                      ),
                      LinkButton(
                        onPressed: () => snapshot.publish(),
                        label: snapshot.exercise.published
                            ? "UNPUBLISH"
                            : "PUBLISH",
                      ),
                    ],
                    expandedHeight: Style.expandedAppBarHeight,
                    backgroundColor: Style.surface,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        snapshot.exercise?.name ?? "NULL",
                        style: Style.title,
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Wrap(
                      runSpacing: Style.smallPadding,
                      spacing: Style.smallPadding,
                      children: _buildList(context, snapshot),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildList(BuildContext context, ExerciseLogic snapshot) {
    List<Widget> list = [];
    list.add(
      CreateSubmissionTile(
        exercisePath: snapshot.exercisePath,
      ),
    );
    var tiles = snapshot.submissions.map(
      (e) => SubmissionTile(
        contributorName: e.submission.contributors.join(","),
        document: e.document,
        exercisePath: snapshot.exercisePath,
      ),
    );
    list.addAll(tiles);
    return list;
  }
}
