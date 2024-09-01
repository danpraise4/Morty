import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFieldLive extends StatefulWidget {
  const AppTextFieldLive({
    super.key,
    required this.controller,
    this.validator,
    this.hint,
  });

  final TextEditingController controller;
  final String? hint;
  final dynamic validator;

  @override
  State<AppTextFieldLive> createState() => _AppTextFieldLiveState();
}

class _AppTextFieldLiveState extends State<AppTextFieldLive> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 2,
      controller: widget.controller,
      style:  TextStyle(
          fontWeight: FontWeight.w400, fontSize: 14.sp, color: Colors.white),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hint ?? 'Add Title',
        hintStyle:  TextStyle(
            fontWeight: FontWeight.w400, fontSize: 14.sp, color: Colors.white),
        contentPadding: EdgeInsets.zero,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}
