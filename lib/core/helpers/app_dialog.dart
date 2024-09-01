import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../widgets/app_loading_view.dart';

Future<dynamic> showAppDialog(
  BuildContext context,
  Widget child, {
  bool isDismissible = false,
  bool enableDrag = true,
}) async {
  showModalBottomSheet(
    context: context,
    backgroundColor: Palette.background,
    isScrollControlled: true,
    enableDrag: enableDrag,
    useSafeArea: true,
    constraints: const BoxConstraints(
      maxHeight: 450,
    ),
    isDismissible: isDismissible,
    builder: (context) {
      return child;
    },
  );
}

Future<dynamic> showLoadingDialog(
  BuildContext context,
) async {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Palette.black.withOpacity(0.5),
    builder: (context) {
      return const LoadingView();
    },
  );
}

Future<dynamic> showOverlay(
  BuildContext context,
  final Widget child, {
  bool? isDismissible,
}) async {
  return showDialog(
    context: context,
    barrierDismissible: isDismissible ?? false,
    barrierColor: Palette.background.withOpacity(0.8),
    builder: (context) {
      return child;
    },
  );
}
