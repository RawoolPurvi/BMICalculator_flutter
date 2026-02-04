import 'package:bmi_calc/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cardContent.dart';
import 'reusableCard.dart';
import 'constants.dart';
import 'roundButton.dart';
import 'bottomButton.dart';
import 'calculator_brain.dart';

enum Gender { male, female }

int height = 180;
int weight = 50;
int age = 25;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kInactiveBlockColor
                        : kActiveCardColor,
                    cardChild: CardContent(
                      icons: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kInactiveBlockColor
                        : kActiveCardColor,
                    cardChild: CardContent(
                      icons: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      Text("cm", style: kLabelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayColor: Color(0x29EB1555),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 25.0,
                      ),
                      activeTrackColor: Color(0xFFEB1555),
                      inactiveTrackColor: Colors.white70,
                      thumbColor: Color(0xFFEB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: 120.0,
                      max: 250.0,
                      // activeColor: Color(0xFFEB1555),
                      // inactiveColor: Color(0xFF8D8E98),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT", style: kLabelTextStyle),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: RoundedButton(
                                child: Icon(Icons.remove, color: Colors.white),
                                onpressed: () {
                                  setState(() {
                                    if (weight != 0) {
                                      weight--;
                                    } else {
                                      weight = 0;
                                    }
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RoundedButton(
                                child: Icon(Icons.add, color: Colors.white),
                                onpressed: () {
                                  setState(() {
                                    weight++;
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
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE", style: kLabelTextStyle),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: RoundedButton(
                                child: Icon(Icons.remove, color: Colors.white),
                                onpressed: () {
                                  setState(() {
                                    if (age != 0) {
                                      age--;
                                    } else {
                                      age = 0;
                                    }
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RoundedButton(
                                child: Icon(Icons.add, color: Colors.white),
                                onpressed: () {
                                  setState(() {
                                    age++;
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
          Bottombutton(
            onCalculate: () {
              CalculateBrain calc = CalculateBrain(
                weight: weight,
                height: height,
              );
              // Navigator.pushNamed(context, '/bmiCalc');;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(
                    bmiResult: calc.CalculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            buttonName: "CALCULATE",
          ),
        ],
      ),
    );
  }
}
