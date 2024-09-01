import 'package:haptic_feedback/haptic_feedback.dart';

class HapticHandler {
  bool canVibrate = false; // set vibrate to false

  static final HapticHandler instance = _internal;
  static final HapticHandler _internal = HapticHandler._();

  HapticHandler._();
  // init and do check
  init() async {
    canVibrate = await Haptics.canVibrate();
  }

  vibrate({required HapticsType type}) async {
    if (!canVibrate) return;
    Haptics.vibrate(type);
  }
}
