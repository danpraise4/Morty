import 'package:flutter/material.dart';

extension NumbersExtension on num {
  BorderRadius get br {
    return BorderRadius.circular(toDouble());
  }

  EdgeInsets get insets {
    return EdgeInsets.all(toDouble());
  }
}

extension InsetsExtention on List<num> {
  EdgeInsets get insets {
    return switch (length) {
      1 => EdgeInsets.all(this[0].toDouble()),
      2 => EdgeInsets.symmetric(
          horizontal: this[0].toDouble(), vertical: this[1].toDouble()),
      4 => EdgeInsets.fromLTRB(this[0].toDouble(), this[1].toDouble(),
          this[2].toDouble(), this[3].toDouble()),
      _ => EdgeInsets.all(this[0].toDouble()),
    };
  }
}
