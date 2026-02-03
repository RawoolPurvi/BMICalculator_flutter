import 'package:flutter/material.dart';
import 'constants.dart';

class CardContent extends StatelessWidget {
  CardContent({this.icons, this.label});
  final IconData? icons;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icons, size: 80.0, color: Color(0xFFFFFFFF)),
        SizedBox(height: 10.0),
        Text(
          label ?? '',
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}