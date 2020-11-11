// import 'package:correct/logic/exercise.dart';
// import 'package:correct/widgets/elevated_list_tile.dart';
// import 'package:flutter/material.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// class ExerciseTile extends StatelessWidget {
//   final Exercise exercise;
//   final String exercisePath;
//   const ExerciseTile(
//       {Key key, @required this.exercise, @required this.exercisePath})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedListTile(
//       title: this.exercise.name,
//       leading: Icon(MdiIcons.fileDocument),
//       onPressed: () =>
//           Navigator.pushNamed(context, "/home/exercise", arguments: {
//         "exercise": exercise,
//         "exercisePath": exercisePath,
//       }),
//     );
//   }
// }
