import 'package:correct/logic/dataobjects/exercise_info.dart';
import 'package:correct/logic/services/api_service.dart';
import 'package:correct/logic/services/exercise_service.dart';
import 'package:correct/utils/style.dart';
import 'package:correct/widgets/elevated_list_tile.dart';
import 'package:correct/widgets/responsive_constrained_box.dart';
import 'package:flutter/material.dart';

class ExercisesPage extends StatelessWidget {
  final String groupId;
  const ExercisesPage({
    Key key,
    @required this.groupId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ExerciseInfo>>(
        stream: ExerciseService.instance.listenToExerciseInfos("asdsdf"),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              alignment: Alignment.topCenter,
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Style.primaryColor),
                backgroundColor: Style.primaryColor.withOpacity(0.5),
              ),
            );
          }
          return CenteredConstrainedBox(
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Style.smallPadding),
                    child: RaisedButton.icon(
                      onPressed: () => Navigator.pushNamed(
                          context, "/group/$groupId/add/exercise"),
                      textColor: Colors.white,
                      icon: Icon(Icons.add),
                      label: Text("ADD"),
                    ),
                  ),
                ),
                ...snapshot.data.map(
                  (e) => ElevatedListTile(
                    title: e.name,
                    onPressed: () => Navigator.pushNamed(
                        context, "/group/$groupId/exercise/${e.id}"),
                  ),
                )
              ],
            ),
          );
        });
  }
}
