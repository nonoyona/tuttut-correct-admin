import 'dart:html';

import 'package:correct/pages/correct_exercise/exercise_page.dart';
import 'package:correct/pages/correct_submission/submission_page.dart';
import 'package:correct/pages/create_exercise/create_exercise_page.dart';
import 'package:correct/pages/create_user/create_user_page.dart';
import 'package:correct/pages/home/home_page.dart';
import 'package:correct/pages/initial/initial_page.dart';
import 'package:correct/pages/select_voters/select_voters_page.dart';
import 'package:correct/pages/signin/signin_page.dart';
import 'package:correct/pages/user_management/user_management.dart';
import 'package:correct/pages/user_management/user_management_logic.dart';
import 'package:correct/utils/simple_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyRouteFactory {
  Route<dynamic> getRoute(RouteSettings settings) {
    var data = _parseRouteSettings(settings);
    if (data == null) {
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text("ERROR"),
          ),
        ),
      );
    }
    switch (data.path) {
      case "/redirect":
      case "/":
        return SimpleRoute(
          builder: (_) => InitialPage(),
          settings: settings,
        );
      case "/signin":
        return SimpleRoute(
          settings: settings,
          builder: (context) => SignInPage(),
        );
      case "/home":
        return SimpleRoute(
          settings: settings,
          builder: (context) => HomePage(),
        );
      case "/home/users":
        return SimpleRoute(
          settings: settings,
          builder: (context) => UserManagementPage(),
        );
      case "/home/users/add":
        return SimpleRoute(
          settings: settings,
          builder: (context) => CreateUserPage(),
        );
      case "/home/create":
        return SimpleRoute(
          settings: settings,
          builder: (context) => CreateExercisePage(),
        );
      case "/home/exercise":
        return SimpleRoute(
          settings: settings,
          builder: (context) => ExercisePage(
            exercise: data.arguments["exercise"],
            exercisePath: data.arguments["exercisePath"],
          ),
        );
      case "/home/exercise/submission":
        return SimpleRoute(
          settings: settings,
          builder: (context) => SubmissionPage(
            exercisePath: data.arguments["exercisePath"],
            submission: data.arguments["submission"],
          ),
        );
      case "/home/exercise/voters":
        return SimpleRoute(
          settings: settings,
          builder: (context) => SelectVotersPage(
            exercise: data.arguments["exercise"],
            submissions: data.arguments["submissions"],
          ),
        );
      default:
        return SimpleRoute(
          builder: (_) => InitialPage(),
          settings: settings,
        );
    }
  }

  _RouteData _parseRouteSettings(RouteSettings settings) {
    var windowUri = Uri.tryParse(window.location.href);
    var queryParams = Map<String, dynamic>.from(windowUri.queryParameters);
    print(windowUri.queryParameters);
    print(windowUri.toString());
    if (windowUri.fragment != settings.name) {
      if (settings.name == '/') {
        return null;
      } else {
        print(windowUri.queryParameters);
        window.history.replaceState(
            '', "Sird x KjG", window.location.origin + "/#" + settings.name);
      }
    }
    queryParams.addAll((settings.arguments as Map<String, dynamic>) ?? {});
    return _RouteData(path: settings.name, arguments: queryParams);
  }
}

class _RouteData {
  final String path;
  final Map<String, dynamic> arguments;
  _RouteData({
    @required this.path,
    @required this.arguments,
  });
}
