import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class iconContent extends StatelessWidget {
  iconContent({@required this.icon,this.textd});
  final IconData icon;
  final String textd;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,

        ),
        Text(
            textd,
            style: kLebaletextstyle,
        ),
      ],
    );
  }
}
