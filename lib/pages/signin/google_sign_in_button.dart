import 'package:correct/logic/services/auth_service.dart';
import 'package:correct/utils/style.dart';
import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      elevation: 0,
      color: Colors.white,
      focusColor: Colors.white,
      //highlightColor: Colors.white,
      hoverColor: Colors.white,
      onPressed: () async {
        var user = await AuthService.instance.handleSignIn();
        if (user != null) {
          Navigator.pushReplacementNamed(context, "/home");
        }
      },
      icon: Image.asset(
        "assets/google_logo.png",
        height: Style.buttonText.fontSize * 1.5,
        filterQuality: FilterQuality.high,
      ),
      label: Text("Sign In with Google"),
    );
  }
}
