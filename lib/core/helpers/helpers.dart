import 'package:morty/core/dependencies/timezones.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart';
import 'package:flutter/services.dart';
import 'dart:developer';

void pp(Object? o) {
  if (kDebugMode) {
    print('nmorty====> $o');
  }
}

void ll(Object? o) {
  log('nmorty====> $o');
}

String getPostTime(DateTime time) {
  final now = TZDateTime.from(DateTime.now(), lagos);
  final difference = now.difference(time);

  if (difference < const Duration(minutes: 1)) {
    if (difference.inMinutes == 1) {
      return '${difference.inMinutes}s';
    } else {
      return '${difference.inMinutes}s';
    }
  } else if (difference < const Duration(hours: 1)) {
    if (difference.inMinutes == 1) {
      return '${difference.inMinutes}m';
    } else {
      return '${difference.inMinutes}m';
    }
  } else if (difference < const Duration(hours: 24)) {
    if (difference.inHours == 1) {
      return '${difference.inHours}h';
    } else {
      return '${difference.inHours}h';
    }
  } else if (difference < const Duration(days: 7)) {
    if (difference.inDays == 1) {
      return '${difference.inDays}d';
    } else {
      return '${difference.inDays}d';
    }
  } else if (difference > const Duration(days: 7) &&
      difference < const Duration(days: 30)) {
    if (difference.inDays ~/ 7 == 1) {
      return '${difference.inDays ~/ 7} w';
    } else {
      return '${difference.inDays ~/ 7} w';
    }
  } else if (difference > const Duration(days: 30)) {
    if ((difference.inDays / 30).round() == 1) {
      return '${(difference.inDays / 30).round()}mo';
    } else {
      return '${(difference.inDays / 30).round()}mo';
    }
  } else {
    return '';
  }
}

copyToClipBoard(context,
    {required String text,
    bool showToastMessage = true,
    String toastText = "Copied"}) {
  Clipboard.setData(ClipboardData(text: text)).then(
    (value) {
      if (showToastMessage) {
        /// toast
      }
    },
  );
}

String formatNumberField(String p0) {
  if (p0.startsWith('00') && p0.length > 1) {
    return p0.substring(1);
  } else if (p0.startsWith('0') && p0.length > 1) {
    return p0.substring(1);
  } else {
    return p0;
  }
}

EdgeInsets get appMargin {
  return const EdgeInsets.symmetric(horizontal: 15);
}
