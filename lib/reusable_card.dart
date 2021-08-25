import 'package:flutter/material.dart';

class ReuseCard extends StatelessWidget {
  ReuseCard({
    required this.color,
    required this.cardChild,
    this.onTapEvent,
  });
  final Color color;
  final Widget cardChild;
  final VoidCallback? onTapEvent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {onTapEvent?.call()},
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
