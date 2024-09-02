import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morty/core/resources/strings.dart';
import 'package:morty/features/introduction/app/controller/splash.controller.dart';

class Splash extends StatefulWidget {
  static const String route = "/";

  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late IntroductionController controller;

  @override
  void initState() {
    super.initState();
    controller = IntroductionController(context);
    controller.pushToOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200.w,
          height: 200.w,
          child: Image.asset('$imagePath/rick_morty_1.png'),
        ),
      ),
    );
  }
}
