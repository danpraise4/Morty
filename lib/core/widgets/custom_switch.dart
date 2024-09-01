import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value; // Current state (on/off)
  final Function(bool) onChanged; // Callback for state changes
  final Color activeColor; // Color for the "on" state
  final Color inactiveColor; // Color for the "off" state
  final double width; // Desired width of the switch
  final double height; // Desired height of the switch
  final double borderRadius; // Custom shape for the switch track
  final bool lock;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.width = 46,
    this.height = 25,
    this.borderRadius = 30,
    this.lock = false,
  });

  @override
  State createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late double _currentX;
  late double thumbSize = widget.height * 0.8;

  @override
  void initState() {
    super.initState();
    _currentX = widget.value ? widget.width - (thumbSize + 3) : 3;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.lock ? null : _toggleSwitch,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Switch Track
          Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                color: widget.value ? widget.activeColor : widget.inactiveColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
          ),

          // Switch Thumb
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOutBack,
            left: _currentX,
            top: widget.height / 10,
            child: Container(
              width: thumbSize,
              height: thumbSize,
              decoration: BoxDecoration(
                color: widget.value ? widget.activeColor : widget.inactiveColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _toggleSwitch() {
    setState(() {
      final bool newValue = !widget.value;
      _currentX = newValue ? widget.width - (thumbSize + 3) : 3;
      widget.onChanged(newValue);
    });
  }
}
