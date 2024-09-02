import 'package:morty/core/resources/strings.dart';
import 'package:morty/features/introduction/data/models/onboarding.model.dart';

List<OnboardingModel> get getOnboarindTitles => [
      const OnboardingModel(
        image: '$imagePath/rick_morty_3.png',
        title: "Wubba Lubba Dub Dub!",
        subTitle: "Get ready for a wild ride through the multiverse!",
      ),
      const OnboardingModel(
        image: '$imagePath/rick_2.png',
        title: "Pickle Rick!",
        subTitle: "Because sometimes, you just need to turn into a pickle.",
      ),
      const OnboardingModel(
        image: '$imagePath/rick_morty_2.png',
        title: "Morty, it's time to get schwifty!",
        subTitle: "Prepare for some interdimensional shenanigans!",
      ),
    ];
