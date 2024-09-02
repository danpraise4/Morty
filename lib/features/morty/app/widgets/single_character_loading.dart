import 'package:flutter/material.dart';
import 'package:morty/core/extension/numbers_extensions.dart';
import 'package:morty/core/resources/colors.dart';
import 'package:morty/core/resources/constants.dart';

class SingleProductLoading extends StatefulWidget {
  const SingleProductLoading({super.key});

  @override
  State<SingleProductLoading> createState() => _SingleProductLoadingState();
}

class _SingleProductLoadingState extends State<SingleProductLoading> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            loadingV(h: 130, w: 250),
            h10,
            loadingV(h: 20, w: 100),
            h5,
            loadingV(h: 20, w: 100),
            h10,
            Row(
              children: [
                loadingV(h: 20, w: 20),
                wc(w: 3),
                loadingV(h: 20, w: 20),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                loadingV(h: 20, w: 100),
                const Spacer(),
                loadingV(h: 30, w: 30),
              ],
            )
          ],
        ));
  }

  Widget loadingV({required double w, required double h, int r = 10}) {
    return Container(
      width: w,
      height: h,
      decoration:
          BoxDecoration(color: Colors.grey.shade100, borderRadius: (r).br),
    );
  }
}
