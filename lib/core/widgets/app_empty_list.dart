// ignore_for_file: must_be_immutable

import 'package:flutter_svg/svg.dart';
import 'package:morty/core/resources/constants.dart';
import 'package:morty/core/resources/enum.dart';
import 'package:morty/core/resources/strings.dart';
import 'package:morty/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AppEmptyList extends StatelessWidget {
  const AppEmptyList({
    super.key,
    this.title = "Empty",
    this.okText,
    this.subTitle = "Nothing here to see right now",
    this.isSearch = false,
    this.buttonWidth,
    this.width,
    this.onRefresh,
  });

  final String title;
  final String subTitle;
  final String? okText;
  final bool isSearch;
  final double? buttonWidth;
  final double? width;
  final void Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            '$svgPath/icon_empty.svg',
            height: 90,
          ),
          h15,
          SizedBox(
            width: width,
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
          ),
          h15,
          if (onRefresh != null)
            AppButton(
              width: buttonWidth ?? 180,
              height: 40,
              borderRadius: 24,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0.sp,
              ),
              onPressed: onRefresh,
              text: okText ?? 'Refresh',
              type: AppButtonType.outline,
            ),
        ],
      ),
    );
  }
}
