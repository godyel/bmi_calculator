import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/reusableCard.dart';
import '../components/bottomButton.dart';



class ResultPage extends StatelessWidget {

  ResultPage({@required this.resultTitle, @required this.resultNum, @required this.resultInterpretation});

  final String resultTitle;
  final String resultNum;
  final String resultInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR'
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Text(
              'Your Results',
              style: kResultHeadingTextStyle,
            ),
          ),

          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kactiveColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultTitle.toUpperCase(),
                    style: kResultDegreeHeadingTextStyle,
                  ),

                  Text(
                    resultNum,
                    style: kResultNumberStyle,
                  ),

                  Text(
                    resultInterpretation,
                    textAlign: TextAlign.center,
                    style: kResultCommentStyle,
                  ),

                ],
              ),
            ),
          ),

          BottomButton(
            bottomText: 'RE-CALCULATE',
            onpress: () {
              Navigator.pop(context);
            },

          ),

        ],
      ),
    );
  }
}
