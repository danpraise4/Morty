import 'package:morty/core/extension/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.capitalization = TextCapitalization.none,
    this.action = TextInputAction.next,
    this.align = TextAlign.left,
    required this.controller,
    this.editable = true,
    this.obscure = false,
    this.maxLines = 1,
    this.inputType,
    this.format = true,
    this.onChanged,
    this.onSubmit,
    this.maxLength,
    this.focusNode,
    this.suffix,
    this.suffixSize = 20,
    this.suffixColor = Colors.white,
    this.hint,
    this.style,
  });

  final TextEditingController controller;
  final TextInputType? inputType;
  final bool format;
  final String? hint;
  final bool editable;
  final int maxLines;
  final int? maxLength;
  final TextInputAction action;
  final TextCapitalization capitalization;
  final IconData? suffix;
  final bool obscure;
  final TextAlign align;
  final FocusNode? focusNode;
  final double suffixSize;
  final Color suffixColor;
  final TextStyle? style;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textCapitalization: capitalization,
      keyboardType: inputType,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      readOnly: !editable,
      focusNode: focusNode,
      inputFormatters: (inputType == TextInputType.number && format)
          ? [ThousandsSeparatorInputFormatter()]
          : null,
      autocorrect: false,
      textAlign: align,
      cursorColor: Colors.white38,
      maxLines: maxLines,
      onChanged: onChanged,
      maxLength: maxLength,
      ignorePointers: !editable,
      selectionControls: MaterialTextSelectionControls(),
      buildCounter: maxLength != null
          ? (context,
                  {required currentLength,
                  required isFocused,
                  required maxLength}) =>
              const SizedBox.shrink()
          : null,
      textInputAction: action,
      clipBehavior: Clip.antiAlias,
      onFieldSubmitted: onSubmit,
      style: style ??
          TextStyle(
            fontSize: 14.sp,
          ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.5),
          fontSize: 14.sp,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffix != null
            ? Icon(
                suffix,
                color: suffixColor,
                size: suffixSize,
              )
            : null,
      ),
    );
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat.decimalPattern();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Handle the empty case
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Parse the number and apply the formatting
    final int? number = int.tryParse(newValue.text.stripComma);
    if (number == null) return oldValue;

    final String newText = _formatter.format(number);
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
