import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotifierProviderConsumer<T extends ChangeNotifier>
    extends StatelessWidget {
  final T Function(BuildContext context) create;
  final Widget Function(BuildContext context, T notifier) builder;

  const NotifierProviderConsumer({
    Key key,
    @required this.create,
    @required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: this.create,
      child: Consumer<T>(
        builder: (context, value, child) => this.builder(context, value),
      ),
    );
  }
}
