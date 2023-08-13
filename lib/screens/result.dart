import 'package:bmi_app/calculator.dart';
import 'package:bmi_app/constants.dart';
import 'package:bmi_app/widgets/input_card.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final Calculator calculation;

  const ResultScreen({
    super.key,
    required this.calculation,
  });

  @override
  Widget build(BuildContext context) {
    Color resultColor = calculation.getResult() == 'Normal'
        ? Colors.green
        : calculation.getResult() == 'Underweight'
            ? Colors.yellow
            : Colors.red;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
        elevation: 64,
        shadowColor: kBackgroundShadow,
      ),
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Result',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  InputCard(
                    color: kCardBackgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          calculation.getResult().toUpperCase(),
                          style: TextStyle(
                            color: resultColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          calculation.calculateBMI(),
                          style: const TextStyle(
                            fontSize: 96,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Column(
                          children: [
                            Text(
                              'Normal BMI range:',
                              style: TextStyle(
                                color: kInactiveColor,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              '18.5 - 25 kg/m2',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            calculation.getInterpretation(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: kThemePinkColor,
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "RE-CALCULATE YOUR BMI",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
