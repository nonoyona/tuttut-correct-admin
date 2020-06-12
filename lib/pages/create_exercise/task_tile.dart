import 'package:correct/pages/create_exercise/create_logic.dart';
import 'package:correct/utils/style.dart';
import 'package:correct/widgets/elevated_input_field.dart';
import 'package:correct/widgets/int_input_field.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatelessWidget {
  final int taskId;
  TaskTile({Key key, @required this.taskId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<CreateLogic>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Style.mediumPadding,
        horizontal: Style.smallPadding,
      ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Style.bigPadding,
            horizontal: Style.mediumPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1618,
                    child: ElevatedInputField(
                      hint: "Task name",
                      onChanged: (value) => logic.changeTaskName(taskId, value),
                    ),
                  ),
                  SizedBox(
                    width: Style.smallPadding,
                  ),
                  Expanded(
                    flex: 1000,
                    child: DoubleInputField(
                      hint: "Points",
                      onChanged: (value) =>
                          logic.changeTaskPoints(taskId, value.round()),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      logic.removeTask(taskId);
                    },
                  )
                ],
              ),
              SizedBox(
                height: Style.smallPadding,
              ),
              ElevatedInputField(
                hint: "Task parts e.g. a), b), c)...",
                onChanged: (value) => logic.addParts(taskId, value.split(" ")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
