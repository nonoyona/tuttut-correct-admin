import 'package:correct/utils/style.dart';
import 'package:flutter/material.dart';

class VerticallyCenteredSizedBox extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double height;

  const VerticallyCenteredSizedBox(
      {Key key,
      this.child,
      this.padding = const EdgeInsets.all(Style.smallPadding),
      @required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: (MediaQuery.of(context).size.height - height) / 2,
        ),
        Padding(
          padding: padding,
          child: child ?? Container(),
        )
      ],
    );
  }
}

class CenteredMenu extends StatefulWidget {
  final double height, maxWidth;
  final Widget child, notification;

  const CenteredMenu(
      {Key key,
      @required this.height,
      this.child,
      this.notification,
      this.maxWidth = 600})
      : super(key: key);

  @override
  _CenteredMenuState createState() => _CenteredMenuState();
}

class _CenteredMenuState extends State<CenteredMenu> {
  bool previousNotificationWasNull = true;

  @override
  Widget build(BuildContext context) {
    Future.microtask(
        () => previousNotificationWasNull = widget.notification == null);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Style.primaryColor,
          ),
        ),
        VerticallyCenteredSizedBox(
          height: widget.height,
          child: Card(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: widget.maxWidth),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(Style.smallPadding),
                    height: widget.height,
                    child: widget.child,
                  ),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: !previousNotificationWasNull
                          ? child
                          : SizeTransition(
                              sizeFactor: animation,
                              axis: Axis.vertical,
                              child: child,
                            ),
                    ),
                    child: widget.notification ??
                        Container(
                          key: ValueKey("791b5041-12d0-42d5-b7f1-34d5fea9e5ac"),
                        ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
