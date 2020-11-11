import 'package:correct/logic/dataobjects/student_info.dart';
import 'package:correct/logic/services/student_service.dart';
import 'package:correct/utils/style.dart';
import 'package:correct/widgets/elevated_list_tile.dart';
import 'package:correct/widgets/responsive_constrained_box.dart';
import 'package:flutter/material.dart';

class StudentsPage extends StatelessWidget {
  final String groupId;
  const StudentsPage({
    Key key,
    @required this.groupId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<StudentInfo>>(
        stream: StudentService.instance.listenToStudentInfos(groupId),
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
            child: ListView.builder(
              itemCount: snapshot.data.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Style.smallPadding),
                      child: RaisedButton.icon(
                        onPressed: () =>
                            Navigator.pushNamed(context, "/group/$groupId/add/student"),
                        textColor: Colors.white,
                        icon: Icon(Icons.add),
                        label: Text("ADD"),
                      ),
                    ),
                  );
                } else {
                  return ElevatedListTile(
                    title: snapshot.data[index - 1].name,
                    onPressed: null,
                  );
                }
              },
            ),
          );
        });
  }
}
