import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morty/features/morty/app/widgets/wrap/filter_view.dart';

showAddFilter(context, {required Function onDetect}) {
  showModalBottomSheet(
      context: context,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      constraints: BoxConstraints(
        maxHeight: 380.h,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (_) {
        return FilterView(
          onChangeDetected: () {
            onDetect();
          },
        );
      });
}
