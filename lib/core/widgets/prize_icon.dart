import 'package:flutter/widgets.dart';

class PrizeIcon extends StatelessWidget {
  const PrizeIcon({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return switch (index) {
      0 => Image.asset('assets/images/gold_crown.png'),
      1 => Image.asset('assets/images/silver_crown.png'),
      2 => Image.asset('assets/images/bronze_crown.png'),
      _ => Image.asset('assets/images/white_crown.png'),
    };
  }
}
