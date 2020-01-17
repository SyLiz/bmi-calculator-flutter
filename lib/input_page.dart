import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 75.0;
const bottomContainerColor = Color(0xFFEB1555);
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = activeCardColor;
  Color femaleCardColor = inactiveCardColor;

  //1 = male, 2 = female
  void updateColor(GenderType selectedGender) {
    //male card pressed
    if (selectedGender == GenderType.male) {
      if (maleCardColor == inactiveCardColor) {
        setState(() {
          maleCardColor = activeCardColor;
          femaleCardColor = inactiveCardColor;
        });
      }
    } else {
      if (femaleCardColor == inactiveCardColor) {
        setState(() {
          maleCardColor = inactiveCardColor;
          femaleCardColor = activeCardColor;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      updateColor(GenderType.male);
                    },
                    child: ReuseCard(
                      maleCardColor,
                      GenderIcon('MALE', Icons.male),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      updateColor(GenderType.female);
                    },
                    child: ReuseCard(
                      femaleCardColor,
                      GenderIcon('FEMALE', Icons.female),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseCard(
              activeCardColor,
              Container(),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseCard(
                    activeCardColor,
                    Column(),
                  ),
                ),
                Expanded(
                  child: ReuseCard(
                    activeCardColor,
                    Column(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
