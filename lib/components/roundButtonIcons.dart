import 'package:flutter/material.dart';


//RoundIconButton
class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.colour, this.onpress});
  final IconData icon;
  final Color colour;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, color: colour,),
      onPressed: onpress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 48.0,
        height: 48.0,
      ),
      fillColor: Color(0xFF4C4F58),
      shape: CircleBorder(),
    );
  }
}
