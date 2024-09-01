import 'package:flutter/material.dart';

SliverGridDelegateWithFixedCrossAxisCount getDelegate(int count,
    {double aspectRatio = 1.0}) {
  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: count,
    childAspectRatio: aspectRatio,
  );
}
