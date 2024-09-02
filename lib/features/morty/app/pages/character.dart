import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morty/core/extension/numbers_extensions.dart';
import 'package:morty/core/resources/colors.dart';
import 'package:morty/core/resources/constants.dart';
import 'package:morty/core/resources/strings.dart';
import 'package:morty/core/widgets/app_bar.dart';
import 'package:morty/core/widgets/app_image_preview.dart';
import 'package:morty/features/morty/app/controller/app.controller.dart';
import 'package:morty/features/morty/data/models/character.model.dart';

class Character extends StatefulWidget {
  const Character({super.key, required this.character});
  final CharacterModel character;

  static const String route = "/character";

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character>
    with SingleTickerProviderStateMixin {
  late AppController shopController;

  @override
  void initState() {
    super.initState();
    shopController = AppController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        titleText: widget.character.name,
        onPop: () => Navigator.pop(context),
      ),
      body: contentUI(),
    );
  }

  Widget contentUI() {
    return SingleChildScrollView(
      child: Container(
        margin: 10.insets,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppImageLoader(
              url: widget.character.image,
              h: 230.h,
              w: MediaQuery.sizeOf(context).width,
            ),
            h10,
            Text("Species: ${widget.character.species}"),
            h15,
            Text(
              widget.character.name,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18.sp,
              ),
            ),
            h5,
            Text(
              'Status ${widget.character.status}',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
            h5,
            Text(
              'Location ${widget.character.location.name}',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
            h5,
            h30,
          ],
        ),
      ),
    );
  }
}
