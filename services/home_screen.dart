// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/speech_recognition_service.dart';
import '../services/text_to_speech_service.dart';
import '../widgets/color_display.dart';

class HomeScreen extends StatelessWidget {
		@override
		Widget build(BuildContext context) {
		final speechService = Provider.of<SpeechRecognitionService>(context);
		final ttsService = Provider.of<TextToSpeechService>(context);

		return Scaffold(
				appBar: AppBar(title: Text('IHearYou')),
				body: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
								ColorDisplay(color: speechService.recognizedColor),
								SizedBox(height: 20),
								Text('Status: ${speechService.status}'),
								SizedBox(height: 20),
								ElevatedButton(
										onPressed: () async {
										await speechService.toggleListening();
										if (speechService.recognizedColor != null) {
												await ttsService.speak('Here is the ${speechService.recognizedColor} screen');
										}
										},
										child: Text(speechService.isListening ? 'Stop' : 'Start Listening'),
								),
						],
				),
		);
	}
}