import 'package:flutter/material.dart';

class ColorDisplay extends StatelessWidget {
	final String? color;

	ColorDisplay({this.color});

	@override
	Widget build(BuildContext context) {
		return Container(
			width: double.infinity,
			height: 200,
			color: _getColor(),
		);
	}

	Color _getColor() {
		switch (color) {
			case 'red':
				return Colors.red;
			case 'blue':
				return Colors.blue;
			default:
				return Colors.white;
		}
	}
}