import 'package:flutter/material.dart';

class ReuseCard extends StatelessWidget {
  ReuseCard(this.getColor, this.cardChild);
  final Color getColor;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: getColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
