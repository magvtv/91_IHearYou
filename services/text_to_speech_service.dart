// services/text_to_speech_service.dart
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechService {
	final FlutterTts _flutterTts = FlutterTts();

	Future<void> speak(String text) async {
		await _flutterTts.speak(text);
	}
}