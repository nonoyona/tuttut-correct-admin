import 'package:flutter/material.dart';

class RedirectOnNull extends StatefulWidget {
  final Widget child;
  final List objects;
  RedirectOnNull({Key key, this.child, @required this.objects})
      : super(key: key);

  @override
  _RedirectOnNullState createState() => _RedirectOnNullState();
}

class _RedirectOnNullState extends State<RedirectOnNull> {
  @override
  Widget build(BuildContext context) {
    _redirectOnNull(context);
    return widget.child ?? Container();
  }

  void _redirectOnNull(BuildContext context) {
    if (widget.objects == null) return;
    Future.microtask(() {
      var success = widget.objects.any((element) => element == null);
      if (success) {
        Navigator.pushNamedAndRemoveUntil(
            context, "/redirect", (route) => false);
      }
    });
  }
}
