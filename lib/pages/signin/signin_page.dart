import 'package:correct/pages/signin/google_sign_in_button.dart';
import 'package:correct/utils/style.dart';
import 'package:correct/widgets/vertically_centered_sized_box.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CenteredMenu(
        height: 200,
        maxWidth: 300,
        child: Column(
          children: <Widget>[
            Text("Sign In", style: Style.title),
            Expanded(
              child: Center(
                child: GoogleSignInButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
