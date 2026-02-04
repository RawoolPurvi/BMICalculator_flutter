import 'package:flutter/material.dart';
import 'constants.dart';

class Bottombutton extends StatelessWidget {
  final VoidCallback onCalculate;
  final String buttonName;
  const Bottombutton({required this.onCalculate, required this.buttonName ,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTap: onCalculate,
            child: Container(
              color: kBottomContainerColor,
              height: kBottomContainerHeight,
              padding: EdgeInsets.only(bottom: 40.0),
              child: Center(child: Text(buttonName, style: kLargeButtonText,)),
            ),
          );
  }
}