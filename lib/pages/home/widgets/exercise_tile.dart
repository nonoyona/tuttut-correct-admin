import 'package:correct/logic/exercise.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ExerciseTile extends StatelessWidget {
  final Exercise exercise;
  final String exercisePath;
  const ExerciseTile(
      {Key key, @required this.exercise, @required this.exercisePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 300,
        child: GFListTile(
          avatar: Icon(MdiIcons.fileDocument),
          titleText: this.exercise.name,
          icon: IconButton(
            icon: Icon(Icons.open_in_browser),
            onPressed: () {
              Navigator.pushNamed(context, "/home/exercise", arguments: {
                "exercise": exercise,
                "exercisePath": exercisePath,
              });
            },
          ),
        ),
      ),
    );
  }
}
