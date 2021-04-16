import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'column_widget.dart';
import 'new_widget.dart';

const double bottomContainerHeight = 80;
const int activeColor = 0xFF1D1E33;
const int inactiveColor = 0xFF111328;
const bottomContainerColor = Colors.pink;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { MALE, FEMALE }

class _InputPageState extends State<InputPage> {
  int maleCardColor = inactiveColor;
  int femaleCardColor = inactiveColor;

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
                  child: NewWidget(
                    onPress: () {
                      setState(() {
                        maleCardColor = activeColor;
                        femaleCardColor = inactiveColor;
                      });
                    },
                    color: Color(maleCardColor),
                    cardChild: ColumnWidget(FontAwesomeIcons.mars, 'MALE'),
                  ),
                ),
                Expanded(
                  child: NewWidget(
                    onPress: () {
                      setState(() {
                        femaleCardColor = activeColor;
                        maleCardColor = inactiveColor;
                      });
                    },
                    color: Color(femaleCardColor),
                    cardChild: ColumnWidget(FontAwesomeIcons.venus, 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: NewWidget(
                  color: Color(activeColor),
                  cardChild: ColumnWidget(FontAwesomeIcons.female, 'FEMALE'),
                ),
              ),
            ],
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: NewWidget(
                    color: Color(activeColor),
                    cardChild: ColumnWidget(FontAwesomeIcons.female, 'FEMALE'),
                  ),
                ),
                Expanded(
                  child: NewWidget(
                    color: Color(activeColor),
                    cardChild: ColumnWidget(FontAwesomeIcons.female, 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: bottomContainerHeight,
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10),
          )
        ],
      ),
    );
  }
}
