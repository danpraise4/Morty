import 'package:morty/core/helpers/helpers.dart';
import 'package:flutter/material.dart';

class PlayerObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);

    // Called when a route has been pushed onto the navigator.
    pp('New route pushed: ${route.settings.name}');
    // You can perform actions or logging here.
  }
}
