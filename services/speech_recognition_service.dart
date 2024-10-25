
// services/speech_recognition_service.dart
import 'package:flutter/foundation.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechRecognitionService with ChangeNotifier {
		final stt.SpeechToText _speech = stt.SpeechToText();
		bool _isListening = false;
		String? _recognizedColor;
		String _status = 'Not listening';

		bool get isListening => _isListening;
		String? get recognizedColor => _recognizedColor;
		String get status => _status;

		Future<void> toggleListening() async {
			if (_isListening) {
				await stopListening();
			} else {
				await startListening();
			}
		}

		Future<void> startListening() async {
			_isListening = await _speech.initialize(
				onStatus: (status) {
					_status = status;
					notifyListeners();
				},
				onError: (error) {
					_status = 'Error: $error';
					notifyListeners();
				},
			);

		if (_isListening) {
			_speech.listen(
				onResult: (result) {
					if (result.finalResult) {
						_processResult(result.recognizedWords);
					}
				},
			);
			_status = 'Listening...';
			notifyListeners();
		}
	}

	Future<void> stopListening() async {
		await _speech.stop();
		_isListening = false;
		_status = 'Not listening';
		notifyListeners();
	}

	void _processResult(String words) {
		final lowerWords = words.toLowerCase();
		if (lowerWords.contains('blue')) {
			_recognizedColor = 'blue';
		} else if (lowerWords.contains('red')) {
			_recognizedColor = 'red';
		} else {
			_recognizedColor = null;
		}
		notifyListeners();
	}
}