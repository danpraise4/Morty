import 'package:morty/core/resources/strings.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class SoundsHandler {
  static Soundpool pool = Soundpool(streamType: StreamType.notification);
  int soundId = -1; // meaninig its not loaded

  static final SoundsHandler instance = _internal;
  static final SoundsHandler _internal = SoundsHandler._();

  SoundsHandler._();
  // init and load sounds
  init() async {
    soundId = await rootBundle
        .load("$soundpath/success.mp3")
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
  }

  play() async {
    return await pool.play(soundId);
  }
}
