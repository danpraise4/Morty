import 'package:mime/mime.dart';
import '../resources/enum.dart';

extension StringExtension on String? {
  String get capitalizeFirstThen {
    return '${this?[0].toUpperCase()}${this?.substring(1).toLowerCase()}';
  }

  String get capitalizeFirstLetter {
    return '${this?.substring(0, 1).toUpperCase()}${this?.substring(1)}';
  }

  String get initials {
    if (this == null || this!.trim().isEmpty) {
      return 'NA';
    }

    final List<String> words = this!.trim().split(RegExp(r'\s+'));

    if (words.length > 1) {
      return '${words[0][0]}${words[1][0]}'.toUpperCase();
    } else if (this!.length > 1) {
      return this!.substring(0, 2).toUpperCase();
    } else {
      return this!.toUpperCase();
    }
  }

  String get capitalizeEach {
    String statement = '';

    if (this != null) {
      final input = this!.replaceAll('_', ' ').trim().toLowerCase();
      for (int i = 0; i < input.length; i++) {
        if (input[i] == ' ') {
          statement += ' ${input[i + 1].replaceAll(
            input[i + 1],
            input[i + 1].toUpperCase(),
          )}';
        } else if (i == 0) {
          statement = input[0].toUpperCase();
        } else {
          if (input[i - 1] != ' ') {
            statement += input[i];
          }
        }
      }
    }

    return statement;
  }

  DateTime? get toDateTime {
    if (this!.contains('/')) {
      final parts = this!.split('/');
      final year = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final day = int.parse(parts[2]);

      return DateTime(year, month, day);
    } else if (this!.contains('-')) {
      final parts = this!.split('-');
      final year = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final day = int.parse(parts[2]);

      return DateTime(year, month, day);
    } else {
      return null;
    }
  }

  bool get isEmptyOrNull {
    if (this == null) {
      return true;
    } else {
      if (this!.isEmpty) {
        return true;
      } else {
        return false;
      }
    }
  }


  String? get mimeType {
    if (this != null) {
      final mime = lookupMimeType(this!);
      if (mime != null) {
        return mime.split('/')[0];
      }

      return null;
    } else {
      return null;
    }
  }

  String get stripComma => this!.replaceAll(',', '');
}
