import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors.dart';

class FieldWrapper extends StatelessWidget {
  FieldWrapper({
    super.key,
    required this.child,
    this.padding,
    this.hMargin = 8.0,
    this.vMargin = 6.0,
    this.radius = 12.0,
    this.height = 45,
    this.label,
    this.labelAlign = MainAxisAlignment.start,
    this.color,
    this.onTap,
  });

  final Widget child;
  final MainAxisAlignment labelAlign;
  final String? label;
  final double height;
  final double? padding;
  final double hMargin;
  final double vMargin;
  final double radius;
  final VoidCallback? onTap;
  final Color? color;

  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        onTap?.call();
        for (final node in focusNode.children) {
          if (node.canRequestFocus) {
            node.requestFocus();
            break;
          }
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (label != null)
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: hMargin.w,
              ),
              child: Row(
                mainAxisAlignment: labelAlign,
                children: [
                  Text(
                    label!,
                    style: const TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),
          Container(
            height: height,
            width: double.infinity,
            padding: padding != null ? EdgeInsets.all(padding!) : null,
            margin: EdgeInsets.symmetric(
                horizontal: hMargin.w, vertical: vMargin.h),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: color ?? Palette.cardColor,
              borderRadius: BorderRadius.circular(radius.r),
              border: Border.all(
                color: Palette.iconColor.withOpacity(0.1),
              ),
            ),
            child: Focus(
              focusNode: focusNode,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
