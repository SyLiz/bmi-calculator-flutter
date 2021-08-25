import 'package:flutter/material.dart';
import 'constants.dart';

class GenderIcon extends StatelessWidget {
  GenderIcon(this.genderText, this.genderIcon);
  final String genderText;
  final IconData genderIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          genderText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
