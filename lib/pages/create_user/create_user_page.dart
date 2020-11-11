import 'package:correct/pages/create_user/create_user_logic.dart';
import 'package:correct/utils/utils.dart';
import 'package:correct/widgets/elevated_input_field.dart';
import 'package:correct/widgets/notifier_provider_consumer.dart';
import 'package:correct/widgets/responsive_constrained_box.dart';
import 'package:flutter/material.dart';

class CreateStudentPage extends StatelessWidget {
  final String groupId;
  CreateStudentPage({Key key, @required this.groupId}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return NotifierProviderConsumer<CreateUserLogic>(
        create: (context) => CreateUserLogic(groupId: groupId),
        builder: (context, logic) {
          Future.microtask(() => _handleLogic(context, logic));
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              toolbarHeight: 100,
              automaticallyImplyLeading: false,
              titleSpacing: 30,
              title: Text(
                "TutTut | Add Student",
                style: Style.title,
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: CenteredConstrainedBox(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(Style.smallPadding),
                    child: ElevatedInputField(
                      controller: logic.nameController,
                      labelText: "Name",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Style.smallPadding),
                    child: ElevatedInputField(
                      controller: logic.idController,
                      labelText: "ID",
                      trailing: FlatButton(
                        child: Text(
                          "GENERATE",
                          style: Style.buttonText
                              .copyWith(color: Style.primaryColor),
                        ),
                        onPressed: () {
                          logic.generateId();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Style.mediumPadding,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: RaisedButton(
                      onPressed: () => logic.addStudent(),
                      child: Text(
                        "ADD",
                        style: Style.buttonText,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  _handleLogic(BuildContext context, CreateUserLogic logic) {
    if (logic.state == CreateUserState.LOADING) {
      _scaffoldKey.currentState.hideCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Loading",
                  style: Style.subtitle.copyWith(color: Colors.white)),
              CircularProgressIndicator(),
            ],
          ),
          duration: Duration(hours: 2),
        ),
      );
    } else if (logic.state == CreateUserState.SUCCESS) {
      _scaffoldKey.currentState.hideCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Added Student",
              style: Style.subtitle.copyWith(color: Colors.white)),
        ),
      );
      Future.delayed(Duration(milliseconds: 500), () => Navigator.pop(context));
    } else if (logic.state == CreateUserState.FALIURE) {
      _scaffoldKey.currentState.hideCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          backgroundColor: Style.errorColor,
          content: Text("Adding failed",
              style: Style.subtitle.copyWith(color: Colors.white)),
        ),
      );
    }
  }
}
