import 'package:correct/pages/create_exercise/create_exercise_logic.dart';
import 'package:correct/pages/create_exercise/create_exercise_state.dart';
import 'package:correct/pages/create_group/create_group_logic.dart';
import 'package:correct/pages/create_group/create_group_state.dart';
import 'package:correct/utils/style.dart';
import 'package:correct/widgets/elevated_input_field.dart';
import 'package:correct/widgets/responsive_constrained_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateExercisePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final String groupId;
  CreateExercisePage({
    Key key,
    @required this.groupId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateExerciseLogic>(
      create: (context) => CreateExerciseLogic(groupId: groupId),
      child: BlocConsumer<CreateExerciseLogic, CreateExerciseState>(
        listener: _handleLogic,
        builder: (context, state) {
          final logic = CreateExerciseLogic.of(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              toolbarHeight: 100,
              automaticallyImplyLeading: false,
              titleSpacing: 30,
              title: Text(
                "TutTut | Create Exercise",
                style: Style.title,
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: CenteredConstrainedBox(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Style.smallPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedInputField(
                      controller: nameController,
                      labelText: "Name",
                      onSubmit: (value) => logic.onSubmit(value),
                    ),
                    SizedBox(
                      height: Style.smallPadding,
                    ),
                    RaisedButton(
                      onPressed: state.maybeWhen(
                        orElse: () => () => logic.onSubmit(nameController.text),
                        submitting: () => null,
                      ),
                      textColor: Colors.white,
                      child: state.maybeWhen(
                        orElse: () => Text("SUBMIT"),
                        submitting: () => CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation(Style.primaryColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleLogic(BuildContext context, CreateExerciseState state) {
    state.when(
      standard: (failed) {
        if (failed) {
          scaffoldKey.currentState.showSnackBar(SnackBar(
            backgroundColor: Style.errorColor,
            content: Text("Could not create exercise!"),
          ));
        }
      },
      submitting: () => null,
      success: () {
        scaffoldKey.currentState.showSnackBar(SnackBar(
          backgroundColor: Style.successColor,
          content: Text("Exercise created!"),
        ));
        Future.delayed(
            Duration(milliseconds: 500), () => Navigator.of(context).pop());
      },
    );
  }
}
