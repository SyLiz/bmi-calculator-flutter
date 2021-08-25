import 'package:flutter/material.dart';
import '../screens/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.buttonTitle, required this.onTapEvent});

  final VoidCallback onTapEvent;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {onTapEvent.call()},
      child: Container(
        child: Center(
            child: Text(
          buttonTitle,
          style: kButtonTextStyle,
        )),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
