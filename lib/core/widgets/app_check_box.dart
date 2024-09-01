import 'package:morty/core/extension/numbers_extensions.dart';
import 'package:morty/core/resources/constants.dart';
import 'package:flutter/material.dart';

import '../resources/colors.dart';

class AppCheckBox extends StatefulWidget {
  const AppCheckBox({
    super.key,
    required this.value,
    required this.label,
    required this.onChanged,
  });

  final bool value;
  final Text label;
  final void Function(bool) onChanged;

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  late bool value = widget.value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: 12.br,
      splashColor: Palette.cardColor.withOpacity(0.2),
      onTap: () {
        setState(() => value = !value);
        widget.onChanged(value);
      },
      child: Row(
        children: [
          Checkbox.adaptive(
            value: value,
            side: const BorderSide(
              width: 0.8,
              color: Colors.white,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            activeColor: Palette.transpernt,
            onChanged: (x) {
              setState(() {
                value = x!;
              });

              widget.onChanged(x!);
            },
          ),
          wc(w: 0),
          Expanded(child: widget.label),
        ],
      ),
    );
  }
}
