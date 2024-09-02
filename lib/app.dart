import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morty/core/dependencies/k_route.dart';
import 'package:morty/core/navigator/krouter_observer.dart';
import 'package:morty/core/resources/colors.dart';
import 'package:morty/features/introduction/app/pages/onboarding.dart';
import 'package:morty/features/introduction/app/pages/splash.dart';
import 'package:morty/features/morty/data/dashboard.dart';

part 'routes.dart';

class MortyApp extends StatefulWidget {
  const MortyApp({super.key});

  static final navKey = GlobalKey<NavigatorState>();
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  State<MortyApp> createState() => _MortyAppState();
}

class _MortyAppState extends State<MortyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // App is going to background, show dialog
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      designSize: MediaQuery.of(context).size,
      builder: (context, child) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
        );

        return MaterialApp(
          navigatorKey: MortyApp.navKey,
          navigatorObservers: [PlayerObserver()],
          scaffoldMessengerKey: MortyApp.scaffoldMessengerKey,
          initialRoute: Splash.route,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: onGenerate,
          themeMode: ThemeMode.light,
          theme: themeData(context),
        );
      },
    );
  }
}
