part of 'app.dart';

Route<dynamic>? onGenerate(RouteSettings settings) {
  switch (settings.name) {
    // Introduction
    case Splash.route:
      return KRoute(child: const Splash());

    case Onboarding.route:
      return KRoute(child: const Onboarding());

    // App
    case Dashboard.route:
      return KRoute(child: const Dashboard());


    case Character.route:
      final character = (settings.arguments as CharacterModel);
      return KRoute(child:  Character(
        character:  character,
      ));

    default:
      return null;
  }
}
