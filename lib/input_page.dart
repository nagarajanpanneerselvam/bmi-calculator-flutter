import 'package:bmi_calculator/calculate_bmi.dart';
import 'package:bmi_calculator/gender_card.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/rocker_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

enum Gender {
  MALE,
  FEMALE,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender updatedGender;
  int updatedHeight = kSliderMin.round();
  int updatedWeight = 50;
  int updatedAge = 20;

  void updateColor(Gender selectedGender) {
    this.updatedGender = selectedGender;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0C1134),
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GenderCard(
                  onTapFunction: () {
                    updateColor(Gender.MALE);
                  },
                  gender: Gender.MALE,
                  genderIcon: FontAwesomeIcons.mars,
                  selectedGender: updatedGender,
                ),
              ),
              Expanded(
                child: GenderCard(
                  onTapFunction: () {
                    updateColor(Gender.FEMALE);
                  },
                  gender: Gender.FEMALE,
                  genderIcon: FontAwesomeIcons.venus,
                  selectedGender: updatedGender,
                ),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                cardColor: kActiveCardColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          updatedHeight.toString(),
                          style: kNumberTextStyle,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    Slider(
                      value: updatedHeight.toDouble(),
                      min: kSliderMin,
                      max: kSliderMax,
                      onChanged: (double newValue) {
                        setState(() {
                          updatedHeight = newValue.round();
                        });
                      },
                    ),
                  ],
                ),
              ))
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          updatedWeight.toString(),
                          style: kNumberTextStyle,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'kg',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onTapFunction: () {
                            if (updatedWeight > 1) {
                              setState(() {
                                updatedWeight--;
                              });
                            }
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onTapFunction: () {
                            if (updatedWeight < 499) {
                              setState(() {
                                updatedWeight++;
                              });
                            }
                          },
                        )
                      ],
                    )
                  ],
                ),
                cardColor: kActiveCardColor,
              )),
              Expanded(
                  child: ReusableCard(
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          updatedAge.toString(),
                          style: kNumberTextStyle,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'years',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onTapFunction: () {
                            if (updatedAge > 1) {
                              setState(() {
                                updatedAge--;
                              });
                            }
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onTapFunction: () {
                            if (updatedAge < 249) {
                              setState(() {
                                updatedAge++;
                              });
                            }
                          },
                        )
                      ],
                    )
                  ],
                ),
                cardColor: kActiveCardColor,
              ))
            ],
          )),
          BottomButton(
            buttonLabel: 'CALCULATE YOUR BMI !',
            onTapFunction: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                CalculateBMI calc =
                    CalculateBMI(height: updatedHeight, weight: updatedWeight);
                return ResultPage(bmi: calc.getBMI());
              }));
            },
          )
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonLabel, @required this.onTapFunction});

  final String buttonLabel;
  final Function onTapFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          onPressed: onTapFunction,
          child: Text(
            buttonLabel,
            style: TextStyle(
              color: Color(0xFFFEE4F7),
            ),
          )),
      width: double.infinity,
      height: kBottomContainerHeight,
      margin: EdgeInsets.only(top: 10),
      color: kBottomCardColor,
    );
  }
}
