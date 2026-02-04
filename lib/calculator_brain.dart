// BMI = mass(kg) / height^2(m)
import 'dart:math';

class CalculateBrain{
  CalculateBrain({required this.weight, required this.height});
  final int weight;
  final int height;
  late double bmi;

  String CalculateBMI(){
    bmi = weight / pow(height/100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(bmi>=25){
      return "Overweight";
    }else if(bmi>18){
      return "Normal";
    }
    else{
      return "Underweight";
    }
  }
  String getInterpretation(){
    if(bmi>=25){
      return "Your body weight is a bit higher than the healthy range. Small lifestyle changes and regular movement can make a big difference.";
    }else if(bmi>18){
      return "Your body weight is within the healthy range. Keep up your balanced lifestyle!";
    }
    else{
      return "Your body weight is slightly below the healthy range. You might benefit from nourishing meals and strength-building habits.";
    }
  }
}