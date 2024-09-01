import 'package:morty/core/extension/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/constants.dart';
import '../resources/enum.dart';

class WarningView extends StatelessWidget {
  const WarningView({
    super.key,
    required this.title,
    required this.details,
    this.severity = SeverityLevel.warning,
    this.width,
  });

  final String title;
  final String details;
  final SeverityLevel severity;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: appliedColor.darken(0.4)),
        color: appliedColor.darken(0.3).withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: appliedColor.darken(0.2),
              ),
              w15,
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    color: appliedColor.darken(0.2),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          // hc(h: 3),
          Row(
            children: [
              wc(w: 40),
              Flexible(
                child: Text(
                  details,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: appliedColor.lighten(0.6),
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Color get appliedColor {
    switch (severity) {
      case SeverityLevel.info:
        return Colors.white;
      case SeverityLevel.warning:
        return Colors.amber;
      case SeverityLevel.critical:
        return Colors.red;
    }
  }
}
