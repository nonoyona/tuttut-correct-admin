import 'package:correct/pages/create_exercise/create_exercise_page.dart';
import 'package:correct/pages/create_group/create_group_page.dart';
import 'package:correct/pages/create_submission/create_submission_page.dart';
import 'package:correct/pages/create_user/create_user_page.dart';
import 'package:correct/pages/exercise/exercise_page.dart';
import 'package:correct/pages/group/group_page.dart';
import 'package:correct/pages/group_overview/group_overview_page.dart';
import 'package:correct/pages/initial/initial_page.dart';
import 'package:correct/pages/signin/signin_page.dart';
import 'package:correct/pages/submission/submission_page.dart';
import 'package:correct/utils/router.dart';
import 'package:correct/utils/style.dart';
import 'package:flutter/material.dart';

void main() {
  //CloudFunctions.instance.useFunctionsEmulator(origin: "//localhost:5001"); //ONLY USE THIS WHILE TESTING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Correct | University of Stuttgart',
      theme: Style.getThemeData(),
      onGenerateRoute: PathRouter(
          paths: [
            RoutePath(
              path: "/",
              route: (data) => InitialPage(),
            ),
            RoutePath(
              path: "/home",
              route: (data) => GroupOverviewPage(),
            ),
            RoutePath(
              path: "/create/group",
              route: (data) => CreateGroupPage(),
            ),
            RoutePath(
              path: "/group/:id",
              route: (data) => GroupPage(
                groupId: data.getString("id"),
              ),
            ),
            RoutePath(
              path: "/group/:id/add/student",
              route: (data) => CreateStudentPage(
                groupId: data.getString("id"),
              ),
            ),
            RoutePath(
              path: "/group/:id/add/exercise",
              route: (data) => CreateExercisePage(
                groupId: data.getString("id"),
              ),
            ),
            RoutePath(
              path: "/group/:groupId/exercise/:exerciseId",
              route: (data) => ExercisePage(
                groupId: data.getString("groupId"),
                exerciseId: data.getString("exerciseId"),
              ),
            ),
            RoutePath(
              path: "/group/:groupId/exercise/:exerciseId/add/submission",
              route: (data) => CreateSubmissionPage(
                groupId: data.getString("groupId"),
                exerciseId: data.getString("exerciseId"),
              ),
            ),
            RoutePath(
              path:
                  "/group/:groupId/exercise/:exerciseId/submission/:submissionId",
              route: (data) => SubmissionPage(
                groupId: data.getString("groupId"),
                submissionId: data.getString("submissionId"),
              ),
            ),
            RoutePath(
              path: "/signin",
              route: (data) => SignInPage(),
            ),
          ],
          notFoundRoute: Scaffold(
            body: Center(
              child: Text("Error"),
            ),
          )).onGenerateRoute,
      initialRoute: "/",
    );
  }
}
