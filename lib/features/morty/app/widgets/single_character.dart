import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morty/app.dart';
import 'package:morty/core/extension/numbers_extensions.dart';
import 'package:morty/core/resources/colors.dart';
import 'package:morty/core/resources/constants.dart';
import 'package:morty/core/widgets/app_button.dart';
import 'package:morty/features/morty/app/pages/character.dart';
import 'package:morty/features/morty/data/models/character.model.dart';

class SingleProduct extends StatefulWidget {
  const SingleProduct({super.key, required this.character});
  final CharacterModel character;

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => MortyApp.navKey.currentState
          ?.pushNamed(Character.route, arguments: (widget.character)),
      child: Container(
          padding: 5.insets,
          decoration: BoxDecoration(
              borderRadius: 10.br,
              border: Border.all(
                color: Palette.fadeGray2,
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: 10.br,
                child: CachedNetworkImage(
                  imageUrl: widget.character.image,
                  height: 130.h,
                  width: 250.w,
                  fit: BoxFit.cover,
                ),
              ),
              h10,
              Text(
                widget.character.gender,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Palette.blueTint2,
                    fontSize: 13.sp),
              ),
              h5,
              Text(
                widget.character.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              h10,
              RatingStars(
                axis: Axis.horizontal,
                value: 2,
                onValueChanged: (v) {},
                starCount: 5,
                starSize: 17,
                maxValue: 5,
                starSpacing: 2,
                valueLabelVisibility: false,
                animationDuration: const Duration(milliseconds: 1000),
                valueLabelPadding:
                    const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                valueLabelMargin: const EdgeInsets.only(right: 8),
                starOffColor: const Color(0xffe7e8ea),
                starColor: Palette.primary,
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    "MYR ",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
                  const Spacer(),
                  AppButton(
                    onPressed: () {},
                    width: 30,
                    height: 30,
                    borderRadius: 40,
                    text: '',
                  )
                ],
              )
            ],
          )),
    );
  }
}
