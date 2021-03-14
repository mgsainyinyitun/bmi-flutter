import 'dart:math';

class CalculatorBrain {
  final height;
  final weight;
  double _bmi;
  CalculatorBrain({this.height,this.weight});

  String calculateBMI(){
     _bmi = (weight/pow(height/100, 2));
     print('bmi issssss'+_bmi.toString());
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return "Over Weight";
    }else if(_bmi > 18.5){
      return "Normal";
    }else{
      return "Under Weight";
    }

}

  String getInterpertation(){
    if(_bmi >= 25){
      return "You have higher than Normal body weight.Try Exercise more";
    }else if(_bmi > 18.5){
      return "You have Normal body weight.Good Job!";
    }else{
      return "You have lower normal body weight. Please eat more food!";
    }
  }
  }