import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart';

enum Gender{
  MALE,
  FEMALE,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReuseableCard(
                    colour: selectedGender==Gender.MALE?kActiveCardColor:kInactiveCardColor,
                    onPress: (){
                    setState(() {
                      selectedGender = Gender.MALE;
                    });
                  },
                  childCard:IconContext(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                )),
                Expanded(
                    child: ReuseableCard(
                    colour: selectedGender==Gender.FEMALE?kActiveCardColor:kInactiveCardColor,
                      onPress: (){
                      setState(() {
                        selectedGender = Gender.FEMALE;
                      });
                      },
                      childCard: IconContext(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                )),
              ],
            )),
            Expanded(
                child: ReuseableCard(
              colour: kCardBackground,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Text("HEIGHT",
                     style: kLabelTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(),style: kNumberTextStyle),
                          Text("cm",style: kLabelTextStyle,)
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                        ),
                        child: Slider(
                            value:height.toDouble(),
                            min: 120,
                            max: 220,
                            inactiveColor: Color(0xFF8D8E98),
                            onChanged: (double newValue){
                              print(newValue);
                              setState(() {
                                height=newValue.toInt();
                              });
                            }
                            ),
                      )
                    ]
                  ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReuseableCard(
                    colour: kCardBackground,
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("WEIGHT",style: kLabelTextStyle,),
                          Text(weight.toString(),style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(width: 10,),
                              RoundIconButton(
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      ),
                )),
                Expanded(
                    child: ReuseableCard(
                    colour: kCardBackground,
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("AGE",style: kLabelTextStyle,),
                          Text(age.toString(),style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(width: 10,),
                              RoundIconButton(
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      ),
                )),
              ],
            )),
            BottomButton(
              onTap: (){
                  CalculatorBrain cal =  CalculatorBrain(height: height,weight: weight);
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ResultPage(
                        bmiValue: cal.calculateBMI(),
                        bmiResultTxt: cal.getResult(),
                        bmiInterTxt: cal.getInterpertation(),
                    );
                  },));
              },
              buttonTitle: "CALCULATE",
            ),
          ],
        ));
  }
}



