import 'package:flutter/widgets.dart';

class LifecycleEventHandler extends WidgetsBindingObserver {
  final Future<void> Function()? resumeCallBack;
  final Future<void> Function()? pauseCallBack;

  LifecycleEventHandler({this.resumeCallBack, this.pauseCallBack});

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      resumeCallBack?.call();
    } else if (state == AppLifecycleState.paused) {
      pauseCallBack?.call();
    }
  }
}