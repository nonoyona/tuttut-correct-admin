import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SubmissionTile extends StatelessWidget {
  final String contributorName;
  final DocumentSnapshot document;
  final String exercisePath;
  const SubmissionTile({
    Key key,
    @required this.contributorName,
    @required this.document,
    @required this.exercisePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 300,
        child: GFListTile(
          avatar: Icon(MdiIcons.fileDocument),
          titleText: this.contributorName,
          icon: IconButton(
            icon: Icon(Icons.open_in_browser),
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/home/exercise/submission",
                arguments: {
                  "submission": document,
                  "exercisePath": exercisePath,
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
