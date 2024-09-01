part of 'app.dart';

Route<dynamic>? onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case Splash.route:
      return KRoute(child: const Splash());

    default:
      return null;
  }
}
