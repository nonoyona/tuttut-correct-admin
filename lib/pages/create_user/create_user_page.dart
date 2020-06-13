import 'package:correct/pages/create_user/create_user_logic.dart';
import 'package:correct/utils/utils.dart';
import 'package:correct/widgets/elevated_input_field.dart';
import 'package:correct/widgets/notifier_provider_consumer.dart';
import 'package:correct/widgets/responsive_constrained_box.dart';
import 'package:flutter/material.dart';

class CreateUserPage extends StatelessWidget {
  CreateUserPage({Key key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return NotifierProviderConsumer<CreateUserLogic>(
        create: (context) => CreateUserLogic(),
        builder: (context, logic) {
          Future.microtask(() => _handleLogic(context, logic));
          return Scaffold(
            key: _scaffoldKey,
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
                    flexibleSpace: FlexibleSpaceBar(
                        title: Text(
                      "Add student",
                      style: Style.title,
                    )),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
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
                            controller: logic.groupController,
                            labelText: "Group",
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(Style.smallPadding),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedInputField(
                                      controller: logic.idController,
                                      labelText: "ID",
                                    ),
                                  ),
                                  SizedBox(
                                    width: Style.smallPadding,
                                  ),
                                  RaisedButton(
                                    child: Text(
                                      "GENERATE",
                                      style: Style.buttonText,
                                    ),
                                    onPressed: () {
                                      logic.generateId();
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Style.mediumPadding,
                            ),
                            RaisedButton(
                              onPressed: () => logic.addStudent(),
                              child: Text(
                                "ADD",
                                style: Style.buttonText,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
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
