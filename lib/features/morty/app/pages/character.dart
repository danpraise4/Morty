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
        onPop: ()=> Navigator.pop(context),
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
            Row(
              children: [
                Text(
                  "Category:",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16.sp,
                  ),
                ),
                Text(" ${widget.character.name}"),
              ],
            ),
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
              "MYR ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  color: Palette.primary),
            ),
            h15,
            sideAction(
              title: Row(
                children: [
                  const Text("Availability:"),
                  w5,
                  Text(
                    "Instore",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: Palette.green),
                  ),
                ],
              ),
              sideCircle: sideCircle(
                'icon-check',
                Palette.green,
              ),
            ),
            h15,
            sideAction(
              title: const Text("Delivery Time Frame"),
              subTitle: "2 days-5 working days",
              sideCircle: sideCircle(
                'icon-bolt',
                Palette.orange,
              ),
            ),
            h15,
            sideAction(
              title: const Text("Deliver to 5 Cities"),
              sideCircle: sideCircle(
                'icon-location',
                Palette.primary,
              ),
            ),
            h15,
            discountSection(),
            h30,
          ],
        ),
      ),
    );
  }



  Widget discountSection() {
    return Container(
      padding: [15, 15].insets,
      decoration: BoxDecoration(
        borderRadius: 10.br,
        color: Palette.primary.withOpacity(.1),
      ),
      child: Row(
        children: [
          Container(
            width: 60.w,
            height: 60.w,
            padding: 15.insets,
            decoration: BoxDecoration(
              color: Palette.white,
              borderRadius: 10.br,
            ),
            child:Container(),
          ),
          w15,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Save money!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: Palette.black),
              ),
              Text(
                "Top up now and enjoy the best price in the market",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: Palette.black),
              ),
              h10,
              Row(
                children: [
              
                  Text(
                    "Compare to market price",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: Palette.primary),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget sideCircle(String icon, dynamic color) {
    return Container(
      width: 30,
      height: 30,
      padding: 7.insets,
      decoration: BoxDecoration(
          borderRadius: 40.br, color: (color as Color).withOpacity(.2)),
      child: SvgPicture.asset('$svgPath/$icon.svg'),
    );
  }

  Widget sideAction({
    required Widget title,
    required Widget sideCircle,
    String? subTitle,
  }) {
    return Row(
      children: [
        sideCircle,
        w10,
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            if (subTitle != null)
              Text(
                subTitle,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: Palette.primary),
              ),
          ],
        ))
      ],
    );
  }
}
