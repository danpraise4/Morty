import 'package:flutter/material.dart';
import '../resources/colors.dart';

import '../resources/enum.dart';

class AppButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String? text;
  final AppButtonType? type;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final Color? iconColor;
  final Color? loaderColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final TextStyle? style;
  final IconData? icon;
  final double? iconSize;
  final double? iconPadding;
  final bool? loading;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Positions positions;
  final Widget? image;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.positions = Positions.before,
    this.type = AppButtonType.primary,
    this.borderRadius,
    this.borderColor,
    this.textColor,
    this.image,
    this.iconColor,
    this.iconPadding,
    this.padding,
    this.margin,
    this.style,
    this.color,
    this.loaderColor,
    this.width,
    this.height,
    this.icon,
    this.iconSize,
    this.loading,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  Widget kIcon() {
    return widget.image != null
        ? widget.image!
        : widget.icon != null
            ? Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.iconPadding ?? 4,
                ),
                child: Icon(
                  widget.icon,
                  color: widget.iconColor ?? Colors.white,
                  size: widget.iconSize ?? 20.0,
                ),
              )
            : const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsetsDirectional.zero,
      child: SizedBox(
        height: widget.height ?? 45.0,
        width: widget.width,
        child: MaterialButton(
          elevation: 0.0,
          color: buttonColor,
          highlightElevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
            side: BorderSide(
              color: widget.borderColor ?? buttonOutlineColor,
              width: 1.8,
            ),
          ),
          onPressed: widget.onPressed,
          padding: widget.padding,
          disabledColor: Colors.grey.withOpacity(0.5),
          child: widget.loading != null && widget.loading!
              ? SizedBox.square(
                  dimension: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 0.8,
                    color: widget.loaderColor ?? Colors.white,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.positions == Positions.before
                        ? kIcon()
                        : const SizedBox.shrink(),
                    widget.positions == Positions.extended ||
                            widget.positions == Positions.leading
                        ? Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              textDirection:
                                  widget.positions == Positions.leading
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                              children: [
                                widget.text == null
                                    ? const SizedBox.shrink()
                                    : Flexible(
                                        child: Text(
                                          widget.text ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: widget.style ??
                                              TextStyle(
                                                color: widget.textColor ??
                                                    Colors.white
                                                        .withOpacity(0.8),
                                                fontWeight: FontWeight.w700,
                                              ),
                                        ),
                                      ),
                                kIcon()
                              ],
                            ),
                          )
                        : widget.text == null
                            ? const SizedBox.shrink()
                            : Text(
                                widget.text!,
                                style: widget.style ??
                                    TextStyle(
                                      color: widget.textColor ?? textColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                    widget.positions == Positions.after
                        ? kIcon()
                        : const SizedBox.shrink(),
                  ],
                ),
        ),
      ),
    );
  }

  Color get buttonColor {
    switch (widget.type) {
      case AppButtonType.primary:
        return widget.color ?? Palette.primary;

      case AppButtonType.outline:
        return widget.color ?? Colors.transparent;

      case AppButtonType.text:
        return widget.color ?? Colors.transparent;

      case AppButtonType.secondary:
        return widget.color ?? Palette.buttonColor;

      default:
        return Theme.of(context).primaryColor;
    }
  }

  Color get buttonOutlineColor {
    switch (widget.type) {
      case AppButtonType.primary:
        return Colors.transparent;

      case AppButtonType.outline:
        return Palette.primary.withOpacity(0.6);

      case AppButtonType.text:
        return Colors.transparent;

      default:
        return Colors.transparent;
    }
  }

  Color get textColor {
    switch (widget.type) {
      case AppButtonType.primary:
        return Colors.white.withOpacity(0.8);

      case AppButtonType.outline:
        return Colors.white.withOpacity(0.8);

      case AppButtonType.secondary:
        return Palette.primary;

      case AppButtonType.text:
        return Colors.white.withOpacity(0.8);

      default:
        return Colors.white.withOpacity(0.8);
    }
  }
}
