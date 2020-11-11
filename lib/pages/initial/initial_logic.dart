import 'package:correct/logic/services/auth_service.dart';
import 'package:flutter/material.dart';

class InitialLogic extends ChangeNotifier {
  String redirect = "";
  InitialLogic() {
    _checkSignIn();
  }

  Future _checkSignIn() async {
    var success = await AuthService.instance.isSignedIn();
    if (success) {
      redirect = "/home";
    } else {
      redirect = "/signin";
    }
    print("redirected");
    notifyListeners();
  }
}
