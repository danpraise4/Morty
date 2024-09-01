import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KAppBar extends AppBar {
  final String? titleText;
  final List<Widget>? actionButtons;
  final PreferredSizeWidget? bottomView;
  final Widget? leadingView;
  final VoidCallback? onPop;
  final double? height;
  final double? leadingViewWidth;
  final TextStyle? titleStyle;
  final double? titleSpace;
  final bool forceTransparency;
  final Color? background;
  final Widget? titleView;
  final IconData? leadingIcon;

  KAppBar({
    super.key,
    this.titleText,
    this.actionButtons,
    this.bottomView,
    this.leadingView,
    this.height,
    this.titleSpace,
    this.titleStyle,
    this.onPop,
    this.leadingViewWidth,
    this.forceTransparency = false,
    this.background,
    this.titleView,
    this.leadingIcon,
  }) : super(
          title: titleText != null
              ? Text(
                  titleText,
                  style: titleStyle ??
                      TextStyle(
                        fontSize: 18.sp,
                      ),
                )
              : titleView,
          actions: actionButtons,
          centerTitle: false,
          elevation: 0.0,
          titleSpacing: titleSpace,
          toolbarHeight: height,
          backgroundColor: background ?? Colors.transparent,
          surfaceTintColor: Colors.transparent,
          bottom: bottomView,
          leadingWidth: leadingViewWidth ?? 38,
          forceMaterialTransparency: forceTransparency,
          leading: leadingView ??
              (onPop != null
                  ? IconButton(
                      splashRadius: 28,
                      onPressed: onPop,
                      icon: Icon(
                        leadingIcon ?? Icons.arrow_back_ios_new_outlined,
                      ),
                    )
                  : const SizedBox.shrink()),
        );
}
