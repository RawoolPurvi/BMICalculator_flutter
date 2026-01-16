import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cardContent.dart';
import 'reusableCard.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveBlockColor = Color.fromARGB(255, 47, 49, 83);
const bottomContainerColor =  Color(0xFFEB1555);
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveBlockColor;
  Color femaleCardColor = inactiveBlockColor;

  // 1 = male, 2 = female
  void updateColor(int gender){
    if(gender == 1){
      if(maleCardColor == inactiveBlockColor){
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveBlockColor;
      }else{
        maleCardColor = inactiveBlockColor;
        femaleCardColor = activeCardColor;
      }
    }else{
      if(femaleCardColor == inactiveBlockColor){
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveBlockColor;
      }else{
        femaleCardColor = inactiveBlockColor;
        maleCardColor = activeCardColor; 
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
                    onTap: (){
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: ReusableCard(
                      colour: maleCardColor,
                      cardChild: CardContent(icons: FontAwesomeIcons.mars, label: "MALE"),
                      ),
                  ),
                ),
                Expanded(
                 child: GestureDetector(
                  onTap: (){
                    setState(() {
                      updateColor(2);
                    });
                  },
                   child: ReusableCard(
                    colour: femaleCardColor,
                    cardChild: CardContent(icons: FontAwesomeIcons.venus, label: "FEMALE"),
                    ),
                 ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: activeCardColor
              ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor
                    ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor
                    ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            height: bottomContainerHeight,
          )
        ],
      )
    );
  }
}