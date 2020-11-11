import 'package:correct/logic/services/auth_service.dart';
import 'package:correct/pages/group_overview/group_overview_page.dart';
import 'package:correct/pages/initial/initial_logic.dart';
import 'package:correct/pages/signin/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InitialLogic>(
      create: (context) => InitialLogic(),
      child: Consumer<InitialLogic>(
        builder: (context, logic, child) {
          if (logic.redirect == "/home") {
            return GroupOverviewPage();
          } else if (logic.redirect == "/signin") {
            return SignInPage();
          }
          return Scaffold(
            body: Center(
              child: Text("redirecting..."),
            ),
          );
        },
      ),
    );
  }

}
