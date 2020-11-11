import 'package:correct/logic/dataobjects/submission_info.dart';
import 'package:correct/pages/exercise/exercise_logic.dart';
import 'package:correct/pages/exercise/exercise_state.dart';
import 'package:correct/utils/utils.dart';
import 'package:correct/widgets/elevated_list_tile.dart';
import 'package:correct/widgets/file_drop_zone.dart';
import 'package:correct/widgets/responsive_constrained_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExercisePage extends StatelessWidget {
  final String groupId;
  final String exerciseId;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ExercisePage({
    Key key,
    @required this.groupId,
    @required this.exerciseId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExerciseLogic>(
      create: (context) => ExerciseLogic(
        exerciseId: exerciseId,
        groupId: groupId,
      ),
      child:
          BlocBuilder<ExerciseLogic, ExerciseState>(builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            toolbarHeight: 100,
            automaticallyImplyLeading: false,
            titleSpacing: 30,
            title: Text(
              "TutTut | Übungsblatt 1",
              style: Style.title,
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: state.when(
            loading: () => Container(
              alignment: Alignment.topCenter,
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Style.primaryColor),
                backgroundColor: Style.primaryColor.withOpacity(0.5),
              ),
            ),
            loaded: (list) => _buildDropzoneWidget(list, context),
          ),
        );
      }),
    );
  }

  DropzoneWidget _buildDropzoneWidget(
      List<SubmissionInfo> list, BuildContext context) {
    return DropzoneWidget(
      child: CenteredConstrainedBox(
        child: ListView.builder(
          itemCount: list.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Style.smallPadding),
                  child: RaisedButton.icon(
                    onPressed: () => Navigator.pushNamed(context,
                        "/group/$groupId/exercise/$exerciseId/add/submission"),
                    textColor: Colors.white,
                    icon: Icon(Icons.add),
                    label: Text("ADD"),
                  ),
                ),
              );
            } else {
              final item = list[index - 1];
              return ElevatedListTile(
                title: item.participants.map((e) => e.name).join(", "),
                onPressed: () => Navigator.pushNamed(context,
                    "/group/$groupId/exercise/$exerciseId/submission/${item.id}"),
                trailing: FlatButton(
                  color: item.passed ? Style.successColor : Style.errorColor,
                  textColor: Colors.white,
                  onPressed: () => null,
                  child: Text(item.points.asString),
                ),
              );
            }
          },
        ),
      ),
      mouseOverChild: Padding(
        padding: const EdgeInsets.all(Style.bigPadding),
        child: Card(
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Center(
                child: Text(
              "Drop File",
              style: Style.title,
            )),
          ),
        ),
      ),
      onFileDrop: (fileData, fileName) async {
        scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Text(
                  "Loading...",
                  style: Style.subtitle.copyWith(color: Colors.white),
                ),
                SizedBox(
                  width: Style.mediumPadding,
                ),
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
        final result =
            await ExerciseLogic.of(context).dropFile(fileData, fileName);
        scaffoldKey.currentState.hideCurrentSnackBar();
        Navigator.pushNamed(context,
            "/group/$groupId/exercise/$exerciseId/submission/${result.id}");
      },
    );
  }
}
