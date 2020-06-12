import 'package:correct/logic/auth_service.dart';
import 'package:flutter/material.dart';

class InitialLogic extends ChangeNotifier {
  String redirect = "";
  final AuthService _auth;
  InitialLogic(this._auth) {
    _checkSignIn();
  }

  Future _checkSignIn() async {
    var success = await this._auth.isSignedIn();
    if (success) {
      redirect = "/home";
    } else {
      redirect = "/signin";
    }
    notifyListeners();
  }
}
