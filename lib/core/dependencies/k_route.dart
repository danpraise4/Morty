import 'package:flutter/material.dart';

class KRoute extends PageRouteBuilder {
  KRoute({
    required Widget child,
    super.settings,
    super.opaque,
    Duration? duration,
  }) : super(
          transitionsBuilder: transitionBuilder,
          transitionDuration: duration ?? const Duration(milliseconds: 200),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );
}

Widget transitionBuilder(context, animation, secondaryAnimation, child) {
  return FadeTransition(
    opacity: animation,
    child: SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 0.1),
        end: const Offset(0, 0),
      ).animate(animation),
      child: child,
    ),
  );
}
