import 'package:flutter/material.dart';

import '../styles/app_durations.dart';

Future<dynamic> navigationFunction({
  required BuildContext context,
  required Widget widget,
  Duration delay = Duration.zero,
}) {
  return Future.delayed(
    delay,
    () async {
      return await Navigator.of(context).pushReplacement(
        buildRoute(widget),
      );
    },
  );
}

PageRouteBuilder<dynamic> buildRoute(Widget widget) {
  return PageRouteBuilder(
    transitionDuration: AppDurations.durationMilli300,
    pageBuilder: (_, __, ___) => widget,
    transitionsBuilder: (context, animation, _, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
