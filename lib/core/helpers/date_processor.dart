import 'package:dart_date/dart_date.dart';
import 'package:intl/intl.dart';

String convertDateToReadable(DateTime dateTime,
    {bool? short, bool addYear = false}) {
  final year = dateTime.year;
  final month = dateTime.month;
  final day = dateTime.day;

  if (dateTime.isThisYear && !addYear) {
    return '${decodeMonth(month, short: short)} $day';
  }

  return '${decodeMonth(month, short: short)} $day, $year';
}

bool getToday(DateTime dateTime) {
  final today = DateTime.now();
  return today.year == dateTime.year &&
      today.month == dateTime.month &&
      today.day == dateTime.day;
}

bool getYesterday(DateTime dateTime) {
  final yesterday = DateTime.now().subtract(const Duration(days: 1));
  return yesterday.year == dateTime.year &&
      yesterday.month == dateTime.month &&
      yesterday.day == dateTime.day;
}

String getDayOfWeek(DateTime dateTime) {
  int dayOfWeek = dateTime.weekday;

  String dayName = "";

  switch (dayOfWeek) {
    case DateTime.monday:
      dayName = "Monday";
      break;
    case DateTime.tuesday:
      dayName = "Tuesday";
      break;
    case DateTime.wednesday:
      dayName = "Wednesday";
      break;
    case DateTime.thursday:
      dayName = "Thursday";
      break;
    case DateTime.friday:
      dayName = "Friday";
      break;
    case DateTime.saturday:
      dayName = "Saturday";
      break;
    case DateTime.sunday:
      dayName = "Sunday";
      break;
    default:
      dayName = "Unknown";
  }
  return dayName;
}

String decodeMonth(int month, {bool? short}) {
  if (short != null && short) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  } else {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}

String toReadableTime(DateTime dateTime) {
  return DateFormat.jm().format(dateTime);
}
