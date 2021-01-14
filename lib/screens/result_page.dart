import '../components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import '../components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class ResultsPage  extends StatelessWidget{

  ResultsPage({@required this.BMIresult,@required this.interpretation,@required this.resultText});

  final String BMIresult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI calculator"),

        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "your result",
                style: kTitletextStyle,
              ),
            ),

          ),
          Expanded(
            flex: 5,
            child: reusableCard(
              colour:  kActivecardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                      resultText.toUpperCase(),
                    style: kResultText,
                  ),
                  Text(
                    BMIresult,
                    style: kBMIresult,
                  ),
                  Text(
                   interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),

                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: "RE-CALCULATE",
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );


  }
}



