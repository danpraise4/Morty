import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morty/core/resources/colors.dart';
import 'package:morty/core/resources/constants.dart';
import 'package:morty/core/widgets/app_button.dart';
import 'package:morty/features/introduction/app/controller/splash.controller.dart';
import 'package:morty/features/introduction/app/widget/single_onboarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  static const String route = "/onboading/";

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late IntroductionController controller;

  @override
  void initState() {
    super.initState();
    controller = IntroductionController(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      controller.preloadImages(
        context,
        controller.konBoarding.map((x) => x.image).toList(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return contentUI();
  }

  Widget contentUI() {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: controller.kcurrentPageIndex,
          builder: (_, value, child) {
            return SafeArea(
                child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 450.h,
                      child: PageView(
                        controller: controller.onBoardingPageController,
                        onPageChanged: (index) =>
                            controller.kcurrentPageIndex.value = index,
                        children: [
                          ...controller.konBoarding.map((p0) {
                            return singleOnboarding(model: p0);
                          })
                        ],
                      ),
                    ),
                    h15,
                    SmoothPageIndicator(
                      controller: controller.onBoardingPageController,
                      count: controller.konBoarding.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Palette.primary,
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: Palette.fadeGray3,
                        expansionFactor: 2,
                      ),
                    ),
                  ],
                ),
                Positioned(
                    bottom: 10,
                    right: 10,
                    width: MediaQuery.sizeOf(context).width,
                    child: Row(
                      children: [
                        AppButton(
                          onPressed: () => controller.prevPage(),
                          text: 'Prev',
                          borderRadius: 40,
                          color: Palette.transpernt,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Palette.primary,
                          ),
                        ),
                        const Spacer(),
                        AppButton(
                          onPressed: () => controller.nextPage(),
                          text: controller.isFinalPage(value)
                              ? 'Enter Now'
                              : 'Skip',
                          borderRadius: 40,
                          color: Palette.transpernt,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Palette.primary,
                          ),
                        )
                      ],
                    ))
              ],
            ));
          }),
    );
  }
}
