import 'package:correct/logic/auth_service.dart';
import 'package:correct/pages/initial/initial_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InitialLogic>(
      create: (context) => InitialLogic(AuthService.of(context)),
      child: Consumer<InitialLogic>(
        builder: (context, logic, child) {
          Future.microtask(() => _handleNotifier(context, logic));
          return Scaffold(
            body: Center(
              child: Text("redirecting..."),
            ),
          );
        },
      ),
    );
  }

  void _handleNotifier(BuildContext context, InitialLogic logic) {
    if (logic.redirect.isNotEmpty) {
      Navigator.pushReplacementNamed(context, logic.redirect);
    }
  }
}
