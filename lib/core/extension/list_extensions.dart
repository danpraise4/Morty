extension StringExtension on List? {
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

  int get getLength {
    if (this == null) {
      return 0;
    } else {
      return this!.length;
    }
  }
}
