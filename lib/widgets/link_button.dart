import 'package:correct/utils/style.dart';
import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  final void Function() onPressed;
  final String label;

  const LinkButton({Key key, @required this.onPressed, @required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: Style.buttonText.copyWith(
          color: Style.secondaryColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
