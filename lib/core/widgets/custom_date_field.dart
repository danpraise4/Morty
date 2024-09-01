import 'package:morty/core/extension/date_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/constants.dart';
import 'package:flutter/material.dart';

class CustomDateField extends StatelessWidget {
  const CustomDateField({
    super.key,
    required this.label,
    required this.dateValue,
    required this.onSetDate,
    this.minDate,
    this.isTimePicker = false,
  });

  final String label;
  final bool isTimePicker;
  final String? dateValue;
  final String? minDate;
  final void Function(String) onSetDate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (isTimePicker) {
          final date = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );

          if (date != null) {
            onSetDate(
                '${date.hour}:${date.minute} ${date.period.name.toUpperCase()}');
          }

          return;
        }
        final date = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: DateTime(2050),
        );

        if (date != null) {
          onSetDate(date.toDateString);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 8.0,
        ),
        child: Row(
          children: [
            w5,
            const Icon(
              Icons.date_range_rounded,
              color: Colors.grey,
            ),
            w10,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 12.0.sp,
                      height: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                  hc(h: 2),
                  Text(
                    dateValue ?? '-',
                    style: TextStyle(
                      fontSize: 14.sp,
                      height: 1.0,
                    ),
                  ),
                ],
              ),
            ),
            w5,
            const Icon(
              Icons.keyboard_arrow_down,
              size: 20,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  DateTime get initialDate {
    if (minDate != null) {
      return DateTime.tryParse(minDate!) ?? DateTime.now();
    } else if (dateValue != null) {
      return DateTime.tryParse(dateValue!) ?? DateTime.now();
    } else {
      return DateTime.now();
    }
  }

  DateTime get firstDate {
    if (minDate != null) {
      return DateTime.tryParse(minDate!) ?? DateTime.now();
    } else {
      return DateTime.now();
    }
  }
}
