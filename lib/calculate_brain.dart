import 'dart:math';
class CalculatorBrain{

  CalculatorBrain({this.height,this.weight});

  final int height;
  final int weight;
  double _BMI;
  String CalculatorBMI(){

     _BMI = weight/pow(height/100, 2) ;
    return _BMI.toStringAsFixed(1);
  }

  String getResult(){
    if(_BMI>=25){
      return "Over weight";
    }
    else if(_BMI>=18.5){
      return "Normal";
    }
    else{
      return "Underweight";
    }
  }

  String getInterpretation(){
    if(_BMI>=25){
      return "you have a higher than normal body weight.Try to exercise more. ";
    }
    else if(_BMI>=18.5){
      return "you have a  normal body weight.Good job!";
    }
    else{
      return "you have a lower than normal body weight.You can eat bit more.";
    }
  }
}