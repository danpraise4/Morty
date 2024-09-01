import 'package:morty/core/extension/string_extensions.dart';
import 'package:morty/core/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppCounterField extends StatefulWidget {
  final TextEditingController controller;
  final bool editable;
  final int min;
  final int max;
  final bool withBorder;
  final bool isAmount;
  final bool stepChangeOnly;
  final double? borderRadius;
  final void Function(String)? onChanged;

  const AppCounterField({
    super.key,
    required this.controller,
    this.editable = true,
    this.withBorder = true,
    this.isAmount = false,
    this.borderRadius,
    this.stepChangeOnly = false,
    this.min = 0,
    this.max = -1,
    this.onChanged,
  });

  @override
  State<AppCounterField> createState() => _AppCounterFieldState();
}

class _AppCounterFieldState extends State<AppCounterField> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      if (widget.controller.text.isEmpty) {
        widget.controller.text = '${widget.min}';
        setState(() {});
      } else if (widget.controller.text == '0') {
        widget.controller.text = '${widget.min}';
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller.text.isEmpty) {
      widget.controller.text = '${widget.min}';
      setState(() {});
    }

    if (!widget.withBorder) {
      return SizedBox(
        height: 50.0,
        child: TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18.0),
          readOnly: !widget.editable || widget.stepChangeOnly,
          onChanged: widget.onChanged,
          inputFormatters: widget.isAmount ? [NumberTextInputFormatter()] : [],
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12.0),
            hintText: '0',
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            prefixIcon: SizedBox.square(
              dimension: 24,
              child: Card(
                shape: widget.borderRadius != null
                    ? RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius!),
                      )
                    : null,
                color: Colors.grey.withOpacity(0.6),
                surfaceTintColor: Colors.grey.withOpacity(0.6),
                child: IconButton(
                  splashRadius: 24,
                  padding: const EdgeInsets.all(4),
                  onPressed: widget.editable
                      ? () {
                          if (int.parse(widget.controller.text.stripComma) >
                              widget.min) {
                            widget.controller.text =
                                '${int.parse(widget.controller.text.stripComma) - 1}';
                            widget.onChanged?.call(widget.controller.text);
                          }
                        }
                      : null,
                  icon: Icon(
                    Icons.remove,
                    color: Palette.background,
                  ),
                ),
              ),
            ),
            suffixIcon: SizedBox.square(
              dimension: 24,
              child: Card(
                color: Colors.grey.withOpacity(0.6),
                shape: widget.borderRadius != null
                    ? RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius!),
                      )
                    : null,
                surfaceTintColor: Colors.grey.withOpacity(0.6),
                child: IconButton(
                  splashRadius: 22,
                  padding: const EdgeInsets.all(4),
                  onPressed: widget.editable
                      ? () {
                          final number =
                              int.parse(widget.controller.text.stripComma);

                          if (widget.max != -1 && number < widget.max) {
                            widget.controller.text =
                                '${int.parse(widget.controller.text.stripComma) + 1}';
                            widget.onChanged?.call(widget.controller.text);
                            return;
                          } else if (widget.max == -1) {
                            widget.controller.text =
                                '${int.parse(widget.controller.text.stripComma) + 1}';
                            widget.onChanged?.call(widget.controller.text);
                          } else {
                            // Don't increment
                          }
                        }
                      : null,
                  icon: Icon(
                    Icons.add,
                    color: Palette.background,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return SizedBox(
      height: 50.0,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18.0),
        readOnly: !widget.editable,
        onChanged: widget.onChanged,
        inputFormatters: widget.isAmount ? [NumberTextInputFormatter()] : [],
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12.0),
          hintText: '0',
          prefixIcon: IconButton(
            splashRadius: 24,
            onPressed: widget.editable
                ? () {
                    if (int.parse(widget.controller.text) > widget.min) {
                      widget.controller.text =
                          '${int.parse(widget.controller.text.stripComma) - 1}';
                      widget.onChanged?.call(widget.controller.text);
                    }
                  }
                : null,
            icon: const Icon(Icons.remove),
          ),
          suffixIcon: IconButton(
            splashRadius: 22,
            onPressed: widget.editable
                ? () {
                    final number = int.parse(widget.controller.text.stripComma);

                    if (widget.max != -1 && number < widget.max) {
                      widget.controller.text =
                          '${int.parse(widget.controller.text.stripComma) + 1}';
                      widget.onChanged?.call(widget.controller.text);
                      return;
                    } else if (widget.max == -1) {
                      widget.controller.text =
                          '${int.parse(widget.controller.text.stripComma) + 1}';
                      widget.onChanged?.call(widget.controller.text);
                    } else {
                      // Don't increment
                    }
                  }
                : null,
            icon: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final numericRegex = RegExp(r'\d+');
    final matches = numericRegex.allMatches(newValue.text);
    final newText = matches.map((match) => match.group(0)).join(',');

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
