import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morty/app.dart';
import 'package:morty/core/extension/numbers_extensions.dart';
import 'package:morty/core/extension/string_extensions.dart';
import 'package:morty/core/resources/colors.dart';
import 'package:morty/core/resources/constants.dart';
import 'package:morty/core/widgets/app_button.dart';
import 'package:morty/features/morty/app/pages/character.dart';
import 'package:morty/features/morty/data/models/character.model.dart';

class SingleCharacter extends StatefulWidget {
  const SingleCharacter({super.key, required this.character});
  final CharacterModel character;

  @override
  State<SingleCharacter> createState() => _SingleCharacterState();
}

class _SingleCharacterState extends State<SingleCharacter> {
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
                '${widget.character.gender} • ${widget.character.species.capitalizeEach}',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Palette.blueTint2,
                    fontSize: 13.sp),
              ),
              h5,
              Text(
                widget.character.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              h10,
              Text(
                'First Seen in',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Palette.blueTint2,
                    fontSize: 13.sp),
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
                    onPressed: () => MortyApp.navKey.currentState?.pushNamed(
                        Character.route,
                        arguments: (widget.character)),
                    width: 30,
                    icon: Icons.arrow_forward_ios_outlined,
                    iconColor: Palette.white,
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
