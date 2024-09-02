import 'package:flutter/material.dart';

class Character extends StatefulWidget {
  const Character({super.key});
  static const String route = "/character";

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
