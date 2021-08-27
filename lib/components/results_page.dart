import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'botton_button.dart';
import '../screens/constants.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              child: Text('Your Result', style: kLabelResultTextStyle),
            ),
            flex: 1,
          ),
          Expanded(
            child: ReuseCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(bmiResult.toUpperCase(), style: kResultTextStyle),
                  Text(resultText, style: kNumberResultTextStyle),
                  Text(
                    interpretation,
                    style: kButtonTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            flex: 6,
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTapEvent: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
