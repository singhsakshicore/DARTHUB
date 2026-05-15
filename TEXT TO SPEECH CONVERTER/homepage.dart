import 'package:flutter_tts/flutter_tts.dart';

class TextServices {
  static final FlutterTts _flutterTts = FlutterTts();

  static Future<void> initTts() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(0.3);
    await _flutterTts.setSpeechRate(0.4);
  }

  static Future<void> speak(String text) async {
    await _flutterTts.speak(text);
  }
}
