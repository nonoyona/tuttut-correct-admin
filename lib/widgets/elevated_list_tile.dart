import 'package:correct/utils/style.dart';
import 'package:flutter/material.dart';

class ElevatedListTile extends StatelessWidget {
  final Widget leading;
  final Widget trailing;
  final String title;
  final void Function() onPressed;
  const ElevatedListTile({
    Key key,
    this.leading,
    this.trailing,
    @required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Style.tinyPadding,
        horizontal: Style.mediumPadding,
      ),
      child: Card(
        child: InkWell(
          onTap: onPressed,
          child: Container(
            height: 50,
            margin: EdgeInsets.all(Style.bigPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ?? Container(),
                SizedBox(
                  width: Style.mediumPadding,
                ),
                Expanded(
                  child: Text(
                    this.title ?? "",
                    style: Style.subtitle,
                  ),
                ),
                this.trailing ?? Icon(Icons.arrow_forward),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
