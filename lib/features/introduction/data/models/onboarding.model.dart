import 'package:morty/core/resources/enum.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String subTitle;
  final ImageType type;

  const OnboardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
    this.type = ImageType.png,
  });
}
