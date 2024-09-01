import 'package:intl/intl.dart';

import '/core/helpers/date_processor.dart';

extension DateTimeExtentions on DateTime {
  String get toDateString {
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }

  String get timeRemaining {
    final dif = difference(DateTime.now());

    int days = dif.inDays;
    int hours = dif.inHours.remainder(24);
    int minutes = dif.inMinutes.remainder(60);

    return '${days}days : ${hours}hrs : ${minutes}min';
  }

  String get toReadableDate => convertDateToReadable(this);
  String get toReadableDateWithYear =>
      convertDateToReadable(this, addYear: true);
  String get toShortReadableDate => convertDateToReadable(this, short: true);
  String get toTime => toReadableTime(this);
  bool get isToday => getToday(this);
  bool get isYesterday => getYesterday(this);
  String get dayOfWeek => getDayOfWeek(this);
  String get monthName => DateFormat('MMMM', 'en').format(this);
  String get monthNameShort => DateFormat('MMM', 'en').format(this);
}
