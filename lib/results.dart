import 'package:bmi_calculator/text_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpret});

  final String bmiResult;
  final String resultText;
  final String interpret;

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
          children: <Widget>[
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(25.0),
                color: Color(0xFF070e1c),
              ),
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Your Result',
                style: TextStyle(color: Colors.lightBlue, fontSize: 30),
              ),
            ),
            SizedBox(height: 75),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: labelTextS,
                  ),
                  Text(
                    bmiResult,
                    style: labelTextS,
                  ),
                  Text(
                    interpret,
                    textAlign: TextAlign.center,
                    style: labelTextS,
                  ),
                ],
              ),
            ),
            SizedBox(height: 125),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                width: 250,
                height: 75,
                child: Text('RE-CALCULATE', style: labelTextS),
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  BotButton({String? butTitle, Null Function()? onTap}) {}
}
