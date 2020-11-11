import 'package:correct/pages/create_group/create_group_logic.dart';
import 'package:correct/pages/create_group/create_group_state.dart';
import 'package:correct/utils/style.dart';
import 'package:correct/widgets/elevated_input_field.dart';
import 'package:correct/widgets/responsive_constrained_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateGroupPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  CreateGroupPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateGroupLogic>(
      create: (context) => CreateGroupLogic(),
      child: BlocConsumer<CreateGroupLogic, CreateGroupState>(
        listener: _handleLogic,
        builder: (context, state) {
          final logic = CreateGroupLogic.of(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              toolbarHeight: 100,
              automaticallyImplyLeading: false,
              titleSpacing: 30,
              title: Text(
                "TutTut | Create Group",
                style: Style.title,
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                FlatButton(
                  child: Text(
                    "LOGOUT",
                    style: Style.buttonText.copyWith(color: Colors.black),
                  ),
                  onPressed: () {},
                ),
              ],
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

  void _handleLogic(BuildContext context, CreateGroupState state) {
    state.when(
      standard: (failed) {
        if (failed) {
          scaffoldKey.currentState.showSnackBar(SnackBar(
            backgroundColor: Style.errorColor,
            content: Text("Could not create group!"),
          ));
        }
      },
      submitting: () => null,
      success: () {
        scaffoldKey.currentState.showSnackBar(SnackBar(
          backgroundColor: Style.successColor,
          content: Text("Group created!"),
        ));
        Future.delayed(
            Duration(milliseconds: 500), () => Navigator.of(context).pop());
      },
    );
  }
}
