import 'package:morty/core/extension/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    this.value,
    required this.items,
    required this.onChange,
    required this.hint,
  });

  final String? value;
  final List<String> items;
  final String hint;
  final void Function(String) onChange;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: widget.value,
      borderRadius: BorderRadius.circular(12),
      alignment: Alignment.centerLeft,
      style: TextStyle(
        fontSize: 13.sp,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.3),
          fontSize: 13.sp,
        ),
        hintText: widget.hint,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      items: widget.items
          .map((e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e.capitalizeEach),
              ))
          .toList(),
      onChanged: (p0) => widget.onChange(p0!),
    );
  }
}
