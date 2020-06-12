import 'package:correct/logic/auth_service.dart';
import 'package:correct/pages/create_exercise/create_logic.dart';
import 'package:correct/pages/create_exercise/task_tile.dart';
import 'package:correct/utils/style.dart';
import 'package:correct/widgets/elevated_input_field.dart';
import 'package:correct/widgets/link_button.dart';
import 'package:correct/widgets/notifier_provider_consumer.dart';
import 'package:correct/widgets/responsive_constrained_box.dart';
import 'package:flutter/material.dart';

class CreateExercisePage extends StatelessWidget {
  const CreateExercisePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotifierProviderConsumer<CreateLogic>(
      create: (context) => CreateLogic(AuthService.of(context)),
      builder: (context, snapshot) {
        _handleLogic(context, snapshot);
        return Scaffold(
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
                  expandedHeight: Style.expandedAppBarHeight,
                  backgroundColor: Style.surface,
                  actions: <Widget>[
                    LinkButton(
                      onPressed: () {
                        snapshot.save();
                      },
                      label: "CREATE",
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    title: ElevatedInputField(
                      hint: "Exercise name",
                      onChanged: (value) => snapshot.changeExerciseName(value),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    _buildList(context, snapshot),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildList(BuildContext context, CreateLogic logic) {
    List<Widget> list = [];
    for (var i = 0; i < logic.exercise.tasks.length; i++) {
      list.add(
        TaskTile(
          taskId: i,
          key: ValueKey(
            logic.exercise.tasks[i].uid,
          ),
        ),
      );
    }
    list.add(RaisedButton(
      child: Text(
        "ADD TASK",
        style: Style.buttonText,
      ),
      onPressed: () {
        logic.addTask();
      },
    ));
    return list;
  }

  void _handleLogic(BuildContext context, CreateLogic snapshot) {
    Future.microtask(() {
      if (snapshot.saved) {
        Navigator.pop(context);
      }
    });
  }
}
