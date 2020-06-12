import 'package:flutter/material.dart';

class CenteredConstrainedBox extends StatelessWidget {
  final Widget child;
  const CenteredConstrainedBox({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1000),
        child: child,
      ),
    );
  }
}
