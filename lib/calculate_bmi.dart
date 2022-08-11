import 'dart:math';

import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class CalculateBMI {
  CalculateBMI({@required this.height, this.weight});

  int height;
  int weight;

  Map getBMI() {
    Map result = new Map();
    double bmi = weight / pow(height / 100, 2);
    Text bmiResult, bmiInterpretation;
    result['bmi'] = bmi.toStringAsFixed(1);

    if (bmi > 25) {
      bmiResult = Text(
        'Overweight',
        style: kResultStatusRedStyle,
      );
      bmiInterpretation = Text(
        'Please start practicing Exercises!',
        style: kResultStatusRedStyle,
      );
    } else if (bmi > 18) {
      bmiResult = Text(
        'Normal',
        style: kResultStatusGreenStyle,
      );
      bmiInterpretation = Text(
        'Keep it Up !',
        style: kResultStatusGreenStyle,
      );
    } else {
      bmiResult = Text(
        'Underweight',
        style: kResultStatusYellowStyle,
      );
      bmiInterpretation = Text(
        'Have healthy intake and  start practicing Exercises!',
        style: kResultStatusYellowStyle,
      );
    }

    result['bmiResult'] = bmiResult;
    result['bmiInterpret'] = bmiInterpretation;

    return result;
  }
}
