import 'package:flutter/material.dart';

class SimpleRoute extends PageRoute {
  final Widget Function(BuildContext context) builder;

  SimpleRoute({this.builder, RouteSettings settings}) : super(settings: settings);

  @override
  Color get barrierColor => Colors.white;

  @override
  String get barrierLabel => "barrier";

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration.zero;
}