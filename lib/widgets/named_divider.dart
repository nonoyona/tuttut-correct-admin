import 'package:correct/utils/style.dart';
import 'package:flutter/material.dart';

class NamedDivider extends StatelessWidget {
  final String label;
  final double height;

  const NamedDivider({
    Key key,
    @required this.label,
    this.height = Style.smallPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Divider(
          height: this.height,
          thickness: 1,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            this.label,
            style: Style.overline.copyWith(
              backgroundColor: Style.surface,
            ),
          ),
        ),
      ],
    );
  }
}