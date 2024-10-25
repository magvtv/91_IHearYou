// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'services/speech_recognition_service.dart';
import 'services/text_to_speech_service.dart';

void main() {
	runApp(
		MultiProvider(
			providers: [
				ChangeNotifierProvider(create: (_) => SpeechRecognitionService()),
				Provider(create: (_) => TextToSpeechService()),
			],
			child: MyApp(),
		),
	);
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'IHearYou',
			theme: ThemeData(
				primarySwatch: Colors.blue,
				visualDensity: VisualDensity.adaptivePlatformDensity,
			),
			home: HomeScreen(),
		);
	}
}