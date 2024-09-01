import 'package:cached_network_image/cached_network_image.dart';
import 'package:morty/core/extension/numbers_extensions.dart';
import 'package:flutter/material.dart';

class AppImageLoader extends StatelessWidget {
  final String url;
  final double? w;
  final double? h;
  final int r;

  final bool sLoader;
  final BoxFit fit;
  const AppImageLoader(
      {super.key,
      required this.url,
      this.w,
      this.h,
      this.r = 10,
      this.fit = BoxFit.cover,
      this.sLoader = true});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: r.br,
      child: CachedNetworkImage(
        imageUrl: url,
        width: w,
        height: h,
        fit: fit,
      ),
    );
  }
}
