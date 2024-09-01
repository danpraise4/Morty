import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BouncingIcon extends StatefulWidget {
  const BouncingIcon({super.key, required this.child});

  final Widget child;

  @override
  State<BouncingIcon> createState() => _BouncingIconState();
}

class _BouncingIconState extends State<BouncingIcon> {
  bool _isUp = true;

  @override
  void initState() {
    super.initState();
    _startBouncing();
  }

  void _startBouncing() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _isUp = !_isUp;
        });
        _startBouncing();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: !_isUp ? 300.ms : 600.ms,
            curve: !_isUp ? Curves.easeIn : Curves.bounceOut,
            top: _isUp ? 20 : 0,
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
