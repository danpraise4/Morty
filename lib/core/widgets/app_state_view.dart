import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors.dart';
import '../resources/constants.dart';

import 'app_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../resources/enum.dart';

class AppStateView extends StatefulWidget {
  final AppState state;
  final String? title;
  final String message;
  final VoidCallback onRightTap;
  final VoidCallback? onLeftTap;
  final String rightText;
  final String? leftText;
  final bool autoNav;

  const AppStateView({
    super.key,
    required this.state,
    required this.message,
    required this.onRightTap,
    this.onLeftTap,
    this.rightText = 'OK',
    this.leftText,
    this.autoNav = false,
    this.title,
  });

  @override
  State<AppStateView> createState() => _AppStateViewState();
}

class _AppStateViewState extends State<AppStateView> {
  @override
  void initState() {
    if (widget.autoNav) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(
            const Duration(milliseconds: 2000), () => widget.onRightTap());
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 80.0,
        // height: 400.0,
        child: Material(
          borderRadius: BorderRadius.circular(12.0),
          type: MaterialType.transparency,
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: stateIcon,
              ),

              //* Vertical Spacer
              const SizedBox(height: 20),

              if (widget.title != null && widget.title!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 4.0,
                  ),
                  child: Text(
                    widget.title!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Palette.primary,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12.0,
                ),
                child: Text(
                  widget.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(),
                ),
              ),

              //* Vertical Spacer
              hc(h: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.leftText != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: SizedBox(
                            height: 40.0,
                            child: AppButton(
                              type: AppButtonType.outline,
                              text: widget.leftText ?? 'Cancel',
                              onPressed: widget.onLeftTap ?? () {},
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  widget.autoNav
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: SizedBox(
                            height: 40.0,
                            child: AppButton(
                              type: AppButtonType.primary,
                              text: okText,
                              onPressed: () => widget.onRightTap.call(),
                            ),
                          ),
                        ),
                ],
              ),

              //* Vertical Spacer
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }

  String get okText {
    if (widget.rightText.isEmpty && widget.state == AppState.failed) {
      return 'Close';
    } else if (widget.state == AppState.info) {
      return widget.rightText;
    } else {
      return widget.rightText;
    }
  }

  Widget get stateIcon {
    switch (widget.state) {
      case AppState.success:
        return CircleAvatar(
          backgroundColor: Palette.primary.withOpacity(0.2),
          radius: 80,
          child: CircleAvatar(
            backgroundColor: Palette.primary.withOpacity(0.2),
            radius: 50,
            child: Icon(
              FontAwesomeIcons.check,
              color: Colors.white.withOpacity(0.7),
              size: 48,
            ),
          ),
        );
      case AppState.failed:
        return CircleAvatar(
          backgroundColor: Palette.primary.withOpacity(0.2),
          radius: 80,
          child: CircleAvatar(
            backgroundColor: Palette.primary.withOpacity(0.2),
            radius: 50,
            child: Icon(
              FontAwesomeIcons.xmark,
              color: Colors.red.shade300,
              size: 48,
            ),
          ),
        );
      default:
        return CircleAvatar(
          backgroundColor: Palette.primary.withOpacity(0.2),
          radius: 80,
          child: CircleAvatar(
            backgroundColor: Palette.primary.withOpacity(0.2),
            radius: 50,
            child: const Icon(
              FontAwesomeIcons.info,
              color: Colors.white,
              size: 48,
            ),
          ),
        );
    }
  }
}
