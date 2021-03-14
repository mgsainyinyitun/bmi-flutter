import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
class ResultPage extends StatelessWidget {
  ResultPage({
    @required this.bmiValue,
    @required this.bmiResultTxt,
    @required this.bmiInterTxt,
});
  final String bmiValue ;
  final String bmiResultTxt;
  final String bmiInterTxt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text("Your Result",style: kTitleTextStyle,),
          )),
          Expanded(child: ReuseableCard(
            colour: kActiveCardColor,
            childCard: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(bmiResultTxt.toUpperCase(),style: kResultTextStyle,),
                Text(bmiValue,style: kBMINumberStyle,),
                Text(bmiInterTxt,style: kBodyTextStyle,textAlign:TextAlign.center),
              ],
            ),
          ),flex: 5,),
          BottomButton(onTap: (){
            Navigator.pop(context);
          }, buttonTitle: "RE-CALCULATE")
        ],
      ),
    );
  }
}
