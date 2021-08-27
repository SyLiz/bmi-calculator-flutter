import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'package:bmi_calculator/screens/constants.dart';
import '../screens/constants.dart';
import 'results_page.dart';
import 'botton_button.dart';
import 'icon_content.dart';
import 'package:bmi_calculator/screens/calculator_fun.dart';

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender = GenderType.male;
  int height = 180;
  int weight = 60;
  int age = 30;

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                // ----- male button -----
                Expanded(
                  child: ReuseCard(
                    onTapEvent: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    color: selectedGender == GenderType.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderIcon('MALE', Icons.male),
                  ),
                ),
                // ----- female button -----
                Expanded(
                  child: ReuseCard(
                    onTapEvent: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    color: selectedGender == GenderType.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderIcon('FEMALE', Icons.female),
                  ),
                ),
              ],
            ),
          ),
          // ------- height Slider ----------
          Expanded(
            child: ReuseCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'CM',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.toInt();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // ----- Weight input -----
                Expanded(
                  child: ReuseCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onLongPressStart: (_) async {
                                isPressed = true;
                                do {
                                  //print('long pressing'); // for testing
                                  setState(() {
                                    if (weight > 15) weight--;
                                  });
                                  await Future.delayed(
                                      Duration(milliseconds: 150));
                                } while (isPressed);
                              },
                              onLongPressEnd: (_) =>
                                  setState(() => isPressed = false),
                              child: FloatingActionButton(
                                heroTag: 'minusWeight',
                                onPressed: () {
                                  setState(() {
                                    if (weight > 15) weight--;
                                  });
                                },
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                              onLongPressStart: (_) async {
                                isPressed = true;
                                do {
                                  //print('long pressing'); // for testing
                                  setState(() {
                                    if (weight < 150) weight++;
                                  });
                                  await Future.delayed(
                                      Duration(milliseconds: 150));
                                } while (isPressed);
                              },
                              onLongPressEnd: (_) =>
                                  setState(() => isPressed = false),
                              child: FloatingActionButton(
                                heroTag: 'plusWeight',
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (weight < 150) weight++;
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                // ----- Age input -----
                Expanded(
                  child: ReuseCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onLongPressStart: (_) async {
                                isPressed = true;
                                do {
                                  //print('long pressing'); // for testing
                                  setState(() {
                                    if (age > 15) age--;
                                  });
                                  await Future.delayed(
                                      Duration(milliseconds: 150));
                                } while (isPressed);
                              },
                              onLongPressEnd: (_) =>
                                  setState(() => isPressed = false),
                              child: FloatingActionButton(
                                heroTag: 'minusAge',
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (age > 15) age--;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                              onLongPressStart: (_) async {
                                isPressed = true;
                                do {
                                  //print('long pressing'); // for testing
                                  setState(() {
                                    if (age < 100) age++;
                                  });
                                  await Future.delayed(
                                      Duration(milliseconds: 150));
                                } while (isPressed);
                              },
                              onLongPressEnd: (_) =>
                                  setState(() => isPressed = false),
                              child: FloatingActionButton(
                                heroTag: 'plusAge',
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (age < 100) age++;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
              buttonTitle: 'CALCULATE',
              onTapEvent: () {
                CalculatorBrain calc =
                    CalculatorBrain(weight: weight, height: height);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              resultText: calc.calculateBMI(),
                              bmiResult: calc.getResult(),
                              interpretation: calc.geInterpretation(),
                            )));
              }),
        ],
      ),
    );
  }
}
