import 'package:flutter/material.dart';

extension XColor on Color {
  /// Apply to any color with a lightness value above 0.5 to lighten it
  Color lighten([double lighness = 0.6]) {
    return Color.lerp(this, Colors.white, lighness) ?? this;
  }

  /// Apply to any color with a darkness value above 0.5 to darken it
  Color darken([double darkness = 0.6]) {
    return Color.lerp(this, Colors.black, darkness) ?? this;
  }
}
