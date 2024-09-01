import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/colors.dart';
import '../resources/enum.dart';
import 'custom_text_field.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final String hint;
  final String label;
  final String? helper;
  final double? height;
  final double? borderRadius;
  final bool isOptional;
  final bool obscure;
  final Widget? suffix;
  final FocusNode? focusNode;
  final IconData? prefix;
  final double? prefixSize;
  final Color? borderColor;
  final Color? fillColor;
  final bool isTextArea;
  final TextCapitalization? capitalization;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final bool? editable;
  final bool? validated;
  final TextFiledDecorationType docorationType;
  final bool? loading;
  final int? maxLength;
  final List<TextInputFormatter>? formatters;
  final void Function()? onEditingComplete;
  final void Function()? onTapOutside;
  final GlobalKey<FormState>? formKey;

  final bool autoTapAction;

  const AppTextField({
    super.key,
    this.formKey,
    required this.controller,
    this.inputType,
    this.inputAction,
    required this.hint,
    required this.label,
    this.focusNode,
    this.autoTapAction = true,
    this.fillColor,
    this.docorationType = TextFiledDecorationType.normal,
    this.onChange,
    this.helper,
    this.borderColor,
    this.borderRadius = 10,
    this.isOptional = true,
    this.height,
    this.suffix,
    this.prefixSize,
    this.onTap,
    this.onEditingComplete,
    this.formatters,
    this.onTapOutside,
    this.prefix,
    this.obscure = false,
    this.capitalization,
    this.validator,
    this.isTextArea = false,
    this.editable,
    this.loading,
    this.validated,
    this.maxLength,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool obscureText = false;

  @override
  void initState() {
    obscureText = widget.obscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox(
          height: widget.height,
          child: TextFormField(
            controller: widget.controller,
            textInputAction: widget.inputAction,
            style: TextStyle(
              fontSize: 14.sp,
              color: Palette.black,
            ),
            maxLength: widget.maxLength,
            keyboardType: widget.inputType,
            focusNode: widget.focusNode,
            validator: widget.validator,
            autocorrect: false,
            enabled: widget.editable,
            spellCheckConfiguration: const SpellCheckConfiguration.disabled(),
            enableSuggestions: true,
            obscureText: obscureText,
            inputFormatters: widget.formatters ??
                [
                  if (widget.inputType == TextInputType.number)
                    ThousandsSeparatorInputFormatter()
                ],
            maxLines: widget.isTextArea ? 3 : 1,
            minLines: widget.isTextArea ? 3 : 1,
            onChanged: widget.onChange,
            obscuringCharacter: '●',
            onTap: widget.onTap,
            textCapitalization:
                widget.capitalization ?? TextCapitalization.none,
            onFieldSubmitted: (p0) => widget.onEditingComplete?.call(),
            // onEditingComplete: widget.onEditingComplete,
            onTapOutside: (event) {
              if (widget.autoTapAction) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
              widget.onTapOutside?.call();
            },
            decoration: InputDecoration(
              filled: widget.docorationType == TextFiledDecorationType.filled,
              fillColor: widget.fillColor ?? Palette.cardColor,
              errorBorder: widget.borderRadius == null
                  ? null
                  : OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error),
                      borderRadius: BorderRadius.circular(
                        widget.borderRadius!,
                      ),
                    ),
              border: widget.borderRadius == null
                  ? null
                  : OutlineInputBorder(
                      borderSide: BorderSide(
                        color:
                            widget.borderColor ?? Colors.black.withOpacity(.4),
                      ),
                      borderRadius: BorderRadius.circular(widget.borderRadius!),
                    ),
              focusedBorder: widget.borderRadius == null
                  ? null
                  : OutlineInputBorder(
                      borderSide: BorderSide(
                        color:
                            widget.borderColor ?? Colors.black.withOpacity(.4),
                      ),
                      borderRadius: BorderRadius.circular(
                        widget.borderRadius!,
                      )),
              disabledBorder: widget.borderRadius == null
                  ? null
                  : OutlineInputBorder(
                      borderSide: BorderSide(
                        color:
                            widget.borderColor ?? Colors.black.withOpacity(.4),
                      ),
                      borderRadius: BorderRadius.circular(
                        widget.borderRadius!,
                      )),
              enabledBorder: widget.borderRadius == null
                  ? null
                  : OutlineInputBorder(
                      borderSide: BorderSide(
                        color:
                            widget.borderColor ?? Colors.black.withOpacity(.4),
                      ),
                      borderRadius: BorderRadius.circular(
                        widget.borderRadius!,
                      )),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              hintStyle: TextStyle(fontSize: 14.sp),
              hintText: widget.hint,
              helperText: widget.helper,
              prefixIcon: widget.prefix != null
                  ? Icon(widget.prefix, size: widget.prefixSize ?? 20.0)
                  : null,
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ),
    );
  }

  Widget? get suffixIcon {
    if (widget.obscure) {
      return IconButton(
        splashRadius: 20.0,
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: Icon(
          obscureText ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey,
        ),
      );
    } else if (widget.loading != null && widget.loading!) {
      return SizedBox.square(
        dimension: 20.0,
        child: Align(
          child: SizedBox.square(
            dimension: 20,
            child: CircularProgressIndicator(
              strokeWidth: 0.8,
              color: Palette.primary,
            ),
          ),
        ),
      );
    } else if (widget.validated == true) {
      return SizedBox.square(
        dimension: 20.0,
        child: Align(
          child: SizedBox.square(
            dimension: 20,
            child: Icon(
              Icons.check,
              size: 16,
              color: Palette.primary,
            ),
          ),
        ),
      );
    } else if (widget.validated == false) {
      return const SizedBox.square(
        dimension: 20.0,
        child: Align(
          child: SizedBox.square(
            dimension: 20,
            child: Icon(
              Icons.close,
              size: 16,
              color: Colors.red,
            ),
          ),
        ),
      );
    } else {
      return widget.suffix;
    }
  }
}
