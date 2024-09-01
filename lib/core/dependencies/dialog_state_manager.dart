class DialogManager {
  DialogManager._internal();

  static final DialogManager instance = DialogManager._internal();

  bool _isShowing = false;
  bool get isShowing => _isShowing;
  set update(bool value) {
    _isShowing = value;
  }
}
