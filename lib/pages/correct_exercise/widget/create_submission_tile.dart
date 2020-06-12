import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:correct/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CreateSubmissionTile extends StatelessWidget {
  final String exercisePath;
  const CreateSubmissionTile({Key key, @required this.exercisePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          border: Border.all(color: Style.secondaryColor),
          borderRadius: BorderRadius.circular(
            Style.mediumRadius,
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              "/home/exercise/submission",
              arguments: {
                "exercisePath": exercisePath,
              },
            );
          },
          child: GFListTile(
            avatar: Visibility(
              maintainInteractivity: false,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: false,
              child: IconButton(
                icon: Icon(Icons.open_in_browser),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/home/exercise/submission",
                    arguments: {
                      "exercisePath": exercisePath,
                    },
                  );
                },
              ),
            ),
            icon: Icon(Icons.add),
            titleText: "CREATE SUBMISSION",
          ),
        ),
      ),
    );
  }
}
