import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/results.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:line_icons/line_icon.dart';
import 'text_type.dart';

enum Gender {
  Male,
  Female,
}

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  late Gender selectedGender;
  int height = 180;
  int weight = 70;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF070e1c),
        appBar: AppBar(
          backgroundColor: Colors.indigo[800],
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF455A64),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.male_rounded,
                              color: Colors.black, size: 100),
                          SizedBox(height: 5),
                          Text('Male', style: labelTextS),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 70),
                  InkWell(
                      onTap: () => setState(() {
                            selectedGender = Gender.Female;
                          }),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF455A64),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Icon(
                              Icons.female_rounded,
                              color: Colors.black,
                              size: 100,
                            ),
                            SizedBox(height: 5),
                            Text('Female', style: labelTextS),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT', style: labelTextS),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(), style: numTextS),
                    Text('cm', style: labelTextS),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newValue) {
                      setState(
                        () {
                          height = newValue.round();
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xF000000),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 5),
                          Text('AGE', style: labelTextS),
                          Text(age.toString(), style: numTextS),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FlatButton(
                                onPressed: () => setState(
                                  () {
                                    age++;
                                  },
                                ),
                                // Color(0xFF455A64),
                                child: Icon(Icons.add_circle_outlined,
                                    color: Colors.blueGrey, size: 60),
                              ),
                              FlatButton(
                                onPressed: () => setState(
                                  () {
                                    age--;
                                  },
                                ),
                                child: Icon(Icons.remove_circle_outlined,
                                    color: Colors.blueGrey, size: 60),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(12.0),
                        color: Color(0xF000000),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 5),
                          Text('WEIGHT', style: labelTextS),
                          Text(weight.toString(), style: numTextS),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FlatButton(
                                onPressed: () => setState(
                                  () {
                                    weight++;
                                  },
                                ),
                                child: Icon(Icons.add_circle_outlined,
                                    color: Colors.blueGrey, size: 60),
                              ),
                              FlatButton(
                                onPressed: () => setState(
                                  () {
                                    weight--;
                                  },
                                ),
                                child: Icon(Icons.remove_circle_outlined,
                                    color: Colors.blueGrey, size: 60),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Calculator calc = Calculator(height: height, weight: weight);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsPage(
                          bmiResult: calc.calcBMI(),
                          resultText: calc.getResult(),
                          interpret: calc.getInterpret(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 75,
                    width: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Text('CALCULATE', style: labelTextS),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
