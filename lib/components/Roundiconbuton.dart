// below code is custom widget also mimic of real widget.we created all property and pass data like we do.icon ,onpress is user define methods not inbuilt.
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget{

  RoundIconButton({@required this.icon,@required this.onpressed});
  final IconData icon;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }

}


//this will create reusable code we use it like function reuse
// ignore: camel_case_types