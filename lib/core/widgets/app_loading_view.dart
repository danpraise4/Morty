import 'package:morty/core/resources/colors.dart';
import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

class LoadingView extends StatelessWidget {
  final double size;

  const LoadingView({super.key, this.size = 80});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: SizedBox.square(
            dimension: size,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              color: Palette.white,
            ),
          ),
        ),
      ),
    );
  }
}
