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
  GenderType selectedGender = GenderType.male;

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
                  child: ReuseCard(
                    onTapEvent: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    color: selectedGender == GenderType.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: GenderIcon('MALE', Icons.male),
                  ),
                ),
                Expanded(
                  child: ReuseCard(
                    onTapEvent: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    color: selectedGender == GenderType.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: GenderIcon('FEMALE', Icons.female),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseCard(
              color: activeCardColor,
              cardChild: Container(),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseCard(
                    color: activeCardColor,
                    cardChild: Container(),
                  ),
                ),
                Expanded(
                  child: ReuseCard(
                    color: activeCardColor,
                    cardChild: Container(),
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

/*
*
* onPress: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                      onPress()
                      * */
