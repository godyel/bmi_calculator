import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({@required this.bottomText, @required this.onpress});

  final String bottomText;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: Center(
          child: Text(
              bottomText,
              style: kCalculateButtonStyle
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        height: kbottomContainerHeight,
        width: double.infinity,
        color: kbottomContainerColor,
      ),
    );
  }
}