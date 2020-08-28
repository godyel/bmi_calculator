
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusableCard.dart';
import '../components/iconContent.dart';
import '../constants.dart';
import '../components/bottomButton.dart';
import '../components/roundButtonIcons.dart';
import 'package:bmi_calculator/calculatorBrain.dart';


// Created an enum to keep track of gender
enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  // this type is obtained from the enum
  Gender selectedGender;
  int height = 120;
  int weight = 50;
  int age = 18;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              letterSpacing: 1
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ? kactiveColor : kinactiveColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female ? kactiveColor : kinactiveColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          // End of the icon content

          Expanded(
              child: ReusableCard(
                colour: kactiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: klabelStyle,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: knumberStyle,
                        ),
                        Text(
                          'cm',
                          style: klabelStyle,
                        ),
                      ],
                    ),

                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x40EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 220,
                        onChanged: (double newHeight) {
                          setState(() {
                            height = newHeight.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kactiveColor,
                    cardChild: Column (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: klabelStyle,
                        ),

                        Text(
                          weight.toString(),
                          style: knumberStyle,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onpress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                              colour: Colors.white,
                            ),

                            SizedBox(
                              width: 10.0,
                            ),

                            RoundIconButton(
                              onpress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                              colour: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),


                Expanded(
                  child: ReusableCard(
                    colour: kactiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: klabelStyle,
                        ),

                        Text(
                          age.toString(),
                          style: knumberStyle,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onpress: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                              colour: Colors.white,
                            ),

                            SizedBox(
                              width: 10.0,
                            ),

                            RoundIconButton(
                              onpress: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                              colour: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          BottomButton(
            bottomText: 'CALCULATE',
            onpress: () {

              CalculatorBrain calcBrain = CalculatorBrain();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    resultTitle: calcBrain.getResult(),
                    resultNum: calcBrain.calculateBMI(),
                    resultInterpretation: calcBrain.getInterpretation(),
                  ),
                )

              );

            },
          ),

        ],
      ),

    );
  }
}




