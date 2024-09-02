import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morty/core/extension/numbers_extensions.dart';
import 'package:morty/core/resources/colors.dart';
import 'package:morty/core/resources/constants.dart';
import 'package:morty/core/resources/enum.dart';
import 'package:morty/features/introduction/data/models/onboarding.model.dart';

Widget singleOnboarding({required OnboardingModel model}) {
  return Container(
    padding: 20.insets,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        (model.type == ImageType.svg)
            ? SvgPicture.asset(
                model.image,
                width: 300.w,
                height: 300.h,
              )
            : Image.asset(
                model.image,
                width: 300.w,
                height: 300.h,
              ),
        h10,
        Text(
          model.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        h5,
        Text(
          model.subTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15.sp,
              color: Palette.black,
              fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}
