import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.cardColor, this.childCard, this.onTapFunction});

  final Color cardColor;
  final Widget childCard;
  final Function onTapFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: childCard,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: cardColor, borderRadius: BorderRadius.circular(10)));
  }
}
