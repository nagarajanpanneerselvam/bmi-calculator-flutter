import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class GenderCard extends StatelessWidget {
  final Gender gender;
  final IconData genderIcon;
  final Gender selectedGender;
  final Function onTapFunction;

  GenderCard(
      {@required this.gender,
      @required this.genderIcon,
      @required this.selectedGender,
      this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: ReusableCard(
        cardColor:
            selectedGender == gender ? kActiveCardColor : kInActiveCardColor,
        childCard: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              genderIcon,
              size: 50,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              gender.name.toUpperCase(),
              style: kLabelTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
