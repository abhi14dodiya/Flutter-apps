import 'package:bmi_calculator/calculate_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
import '../components/Roundiconbuton.dart';
import 'package:bmi_calculator/calculate_brain.dart';

enum Gender{male,female}// we created enum for number data and will same for all

// ignore: camel_case_types
class inputpage extends StatefulWidget{
  @override
  _InputPageState createState() => _InputPageState();

}

class _InputPageState extends State<inputpage>{

  Color malecardcolor = kInactiveCardColor;
  Color femalecardcolor = kInactiveCardColor;

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age  = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child:Row(
            children: <Widget>[
              Expanded(child:GestureDetector(
                child: reusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender  = Gender.male;
                    });
                  },
                    colour:selectedGender == Gender.male ? kActivecardColor:kInactiveCardColor,
                    cardChild: iconContent(icon: FontAwesomeIcons.mars,textd:"MALE"),
                 ),
              )

              ),
              Expanded(child:GestureDetector(
                child: reusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender  = Gender.female;
                    });
                  },
                    colour:selectedGender == Gender.female ? kActivecardColor:kInactiveCardColor,
                  cardChild:iconContent(icon: FontAwesomeIcons.venus,textd:"FEMALE"),
                ),
              )),

            ],
           ),
            ),
          Expanded(child: reusableCard(
            colour:kActivecardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("HEIGHT",
                style:kLebaletextstyle ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(),
                    style: kNumberTextStyle,),
                    Text("cm",
                    style: kLebaletextstyle,),

                  ],

                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor:  Color(0x29EB1555),
                    inactiveTrackColor: Color(0xFF8D8E98),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newvalue){
                      setState(() {
                        height = newvalue.round();
                      });
                    },
                  ),
                ),

              ],
            ),
           ),
          ),
          Expanded(child:Row(
            children: <Widget>[
              Expanded(child:reusableCard(
                  colour:kActivecardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("WEIGHT",
                    style: kLebaletextstyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,

                      children: <Widget>[
                        Text(weight.toString(),
                          style: kNumberTextStyle,),
                        Text("kg",
                        style: kLebaletextstyle,)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                             icon: FontAwesomeIcons.minus,
                             onpressed: (){
                               setState(() {
                                 weight--;
                               });
                             },
                            ),

                        SizedBox(
                          width: 10.0,
                        ),
                         RoundIconButton(
                         icon: FontAwesomeIcons.plus,
                         onpressed:(){
                           setState(() {
                             weight++;
                           });
                         },
                          )
                      ],
                    )

                  ],
                ),
              ),
             ),
              Expanded(child:reusableCard(
                  colour:kActivecardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("AGE",
                      style: kLebaletextstyle,),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onpressed: (){
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onpressed: (){
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )

                    ],
                  ),
              ),),
            ],
          )
          ),
          BottomButton(
               buttonTitle: "CALCULATE",
               onTap: (){
                 CalculatorBrain cals = CalculatorBrain(height: height,weight:weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                BMIresult: cals.CalculatorBMI(),
                resultText: cals.getResult(),
                interpretation: cals.getInterpretation(),
              )));
            },
          ),
         ],
        ),

        );

  }
}






