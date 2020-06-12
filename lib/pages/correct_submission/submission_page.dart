import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:correct/logic/auth_service.dart';
import 'package:correct/pages/correct_submission/submission_logic.dart';
import 'package:correct/pages/correct_submission/submission_page_content.dart';
import 'package:correct/utils/style.dart';
import 'package:correct/widgets/redirect_on_null.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubmissionPage extends StatelessWidget {
  final String exercisePath;
  final DocumentSnapshot submission;

  const SubmissionPage({Key key, @required this.exercisePath, this.submission})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _onExitWithoutSaving(context);
        return false;
      },
      child: ChangeNotifierProvider<SubmissionLogic>(
        create: (context) => SubmissionLogic(
            this.exercisePath, AuthService.of(context), submission),
        child: Consumer<SubmissionLogic>(
          builder: (context, value, child) {
            _handleLogic(context, value);
            return child;
          },
          child: RedirectOnNull(
            objects: [exercisePath],
            child: SubmissionPageContent(),
          ),
        ),
      ),
    );
  }

  void _onExitWithoutSaving(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Correction not saved!"),
          content: Text("Do you really want to exit without saving?"),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text(
                "YES",
                style: Style.buttonText.copyWith(color: Style.errorColor),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "NO",
                style: Style.buttonText.copyWith(color: Style.primaryColor),
              ),
            ),
          ],
        );
      },
    );
  }

  void _handleLogic(BuildContext context, SubmissionLogic snapshot) {
    Future.microtask(() {
      if (snapshot.saved) {
        Navigator.pop(context);
      }
    });
  }
}
