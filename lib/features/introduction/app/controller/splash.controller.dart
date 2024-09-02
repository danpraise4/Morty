import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:morty/app.dart';
import 'package:morty/core/storage/database.dart';
import 'package:morty/core/storage/storage.dart';
import 'package:morty/features/introduction/app/pages/onboarding.dart';
import 'package:morty/features/introduction/data/constants/constants.dart';
import 'package:morty/features/introduction/data/models/onboarding.model.dart';
import 'package:morty/features/morty/data/dashboard.dart';

class IntroductionController {
  BuildContext context;
  IntroductionController(this.context);

  List<OnboardingModel> konBoarding = getOnboarindTitles;
  ValueNotifier<int> kcurrentPageIndex = ValueNotifier(0);
  PageController onBoardingPageController = PageController();

  // Next page
  nextPage() {
    if (onBoardingPageController.page == konBoarding.length - 1) {
      return MortyApp.navKey.currentState
          ?.pushReplacementNamed(Dashboard.route);
    }
    onBoardingPageController.nextPage(
        duration: 500.milliseconds, curve: Curves.easeIn);
  }

  // Is FirstPage
  bool isFinalPage(int value) {
    return value == konBoarding.length - 1;
  }

  // Prev Page
  void prevPage() {
    if (onBoardingPageController.page == 0) return;
    onBoardingPageController.previousPage(
        duration: 500.milliseconds, curve: Curves.easeIn);
  }

  // Splash Screen;
  static bool get checkIsFirstUser {
    return getSettings(path: DB.FIRST_USE) == null;
  }

  // Loan heavy image
  void preloadImages(BuildContext context, List<String> imagePaths) async {
    List<Future<void>> futures = [];

    for (String path in imagePaths) {
      futures.add(precacheImage(AssetImage(path), context));
    }

    await Future.wait(futures);
  }

  // Navigate to Page
  void pushToOnboarding() {
    Timer(3.seconds, () {
      MortyApp.navKey.currentState?.pushReplacementNamed(
          checkIsFirstUser ? Onboarding.route : Onboarding.route // Con
          );
    });
  }
}
