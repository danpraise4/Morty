import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Palette {
  static Color s50 = const Color(0xFFF9F9F9);
  static Color s100 = const Color(0xFFF5F5F5);
  static Color s200 = const Color(0xFFE0E0E0);
  static Color s300 = const Color(0xFFCBCBCB);
  static Color s400 = const Color(0xFFB6B6B6);
  static Color s500 = const Color(0xFF002E66);
  static Color s600 = const Color(0xFF676767);
  static Color s700 = const Color(0xFF494949);
  static Color s800 = const Color(0xFF2B2B2B);
  static Color s900 = const Color(0xFF1f1f1f);
  static Color g100 = const Color(0xFF1C282D);

  static Color red = const Color(0xFF780004);
  static Color transpernt = Colors.transparent;
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color background = Colors.white;
  static Color backgroundTint = const Color(0xFF3f4349);
  static Color backgroundTint2 = const Color(0xFF4e5258);
  static Color green = const Color(0xFF1A7101);
  static Color orange = const Color(0xFFFA8707);

  static Color overlay = const Color(0xFF0D2430);
  static Color primary = const Color(0xFFEE3248);
  static Color blue = const Color(0xFF0161C8);
  static Color blueTint = const Color.fromARGB(255, 143, 212, 246);
  static Color blueTint2 = const Color(0xff59646b);
  static Color iconColor = const Color(0xFFCCC5A9);
  static Color highlightColor = const Color(0xFFF4A261);
  static Color cardColor = const Color(0x44555552);
  static Color textColor = Colors.grey.shade300;
  static Color buttonColor = const Color.fromARGB(84, 73, 75, 76);

  static Color fadeGray1 = Colors.grey.shade100;
  static Color fadeGray2 = Colors.grey.shade200;
  static Color fadeGray3 = Colors.grey.shade300;
  static Color fadeGray4 = Colors.grey.shade400;
}

MaterialColor primarySwatch = MaterialColor(
  Palette.s500.value,
  {
    50: Palette.s50,
    100: Palette.s100,
    200: Palette.s200,
    300: Palette.s300,
    400: Palette.s400,
    500: Palette.s500,
    600: Palette.s600,
    700: Palette.s700,
    800: Palette.s800,
    900: Palette.s900,
  },
);

themeData(BuildContext context) => ThemeData(
      scaffoldBackgroundColor: Palette.background,
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Montserrate',
            bodyColor: Colors.black,
            displayColor: Colors.black,
            fontSizeFactor: 1.sp,
          ),
      primaryTextTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Montserrate',
            bodyColor: Colors.black,
            displayColor: Colors.black,
            fontSizeFactor: 1.sp,
          ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Palette.primary,
          onPrimary: Palette.iconColor,
          secondary: Palette.buttonColor,
          onSecondary: Colors.black,
          error: Palette.buttonColor,
          onError: Colors.white,
          surface: Palette.cardColor,
          onSurface: Colors.white,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 24.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Palette.iconColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.0),
          borderSide: const BorderSide(color: Color(0xFFCBD2D9)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.0),
          borderSide: BorderSide(color: Palette.primary, width: 1.6),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.0),
          borderSide: BorderSide(color: Colors.red.shade300),
        ),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: Palette.background,
        surfaceTintColor: Colors.transparent,
      ),
      colorScheme: ColorScheme.light(
        surface: Palette.background,
        primary: Palette.primary,
        tertiary: Palette.cardColor,
      ),
    );
