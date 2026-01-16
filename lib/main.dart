import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF0A0B21),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 4, // 👈 shadow
          scrolledUnderElevation: 6,    // 👈 shadow when content scrolls
        )
      ),
      home: InputPage(),
    );
  }
}
