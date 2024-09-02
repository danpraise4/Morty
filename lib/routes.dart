part of 'app.dart';

Route<dynamic>? onGenerate(RouteSettings settings) {
  switch (settings.name) {
    // Introduction
    case Splash.route:
      return KRoute(child: const Splash());

    case Onboarding.route:
      return KRoute(child: const Onboarding());

    case Dashboard.route:
      return KRoute(child: const Dashboard());

    default:
      return null;
  }
}
