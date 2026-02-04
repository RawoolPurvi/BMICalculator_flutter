import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusableCard.dart';
import 'input_page.dart';
import 'bottomButton.dart';
import 'calculator_brain.dart';

class Result extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;
  const Result({required this.bmiResult, required this.resultText, required this.interpretation,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: Text("Result", style: kResultPageTitle)),
          Expanded(child: ReusableCard(
            colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(resultText.toUpperCase(), style: kresultPageDesc),
                Text(bmiResult,style: kBMIText),
                Text(interpretation, style: kBodyText, textAlign: TextAlign.center,)
              ],
            ),)),
          Bottombutton(
            onCalculate: (){
                Navigator.pop(context);
            },
            buttonName: "RE-CALCULATE",
          ),
        ],
      ),
    );
  }
}