import 'package:flutter/material.dart';

import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          sliderTheme: SliderTheme.of(context).copyWith(
            thumbColor: Colors.pinkAccent,
            overlayColor: Colors.pinkAccent.withAlpha(0x29),
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 12,
            ),
            overlayShape: RoundSliderOverlayShape(
              overlayRadius: 24,
            ),
            activeTrackColor: Colors.white,
            inactiveTrackColor: Colors.grey,
          ),
          scaffoldBackgroundColor: Color(0xFF0A1033),
          primaryColor: Color(0xFF0A1033)),
      home: SafeArea(child: InputPage()),
    );
  }
}
