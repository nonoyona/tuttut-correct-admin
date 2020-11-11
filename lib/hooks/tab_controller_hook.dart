import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TabControllerHook extends Hook<TabController> {
  final int length;

  TabControllerHook(this.length);

  @override
  _TabControllerHookState createState() => _TabControllerHookState();
}

class _TabControllerHookState
    extends HookState<TabController, TabControllerHook>{
  TabController _controller;

  @override
  void initHook() {
    super.initHook();
  }

  @override
  TabController build(BuildContext context) {
    final vsync = useSingleTickerProvider();
    _controller ??= TabController(length: hook.length, vsync: vsync);
    return _controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

TabController useTabController(int length) {
  return Hook.use(TabControllerHook(length));
}
