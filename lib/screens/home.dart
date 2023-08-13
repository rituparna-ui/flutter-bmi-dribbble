import 'package:bmi_app/calculator.dart';
import 'package:bmi_app/constants.dart';
import 'package:bmi_app/screens/result.dart';
import 'package:bmi_app/widgets/input_card.dart';
import 'package:bmi_app/widgets/styled_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender _selectedGender = Gender.male;
  int height = 183;
  int weight = 74;
  int age = 19;

  void selectGender(Gender gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        InputCard(
                          color: kCardBackgroundColor,
                          onTap: () {
                            selectGender(Gender.male);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.male,
                                color: _selectedGender == Gender.male
                                    ? Colors.white
                                    : kInactiveColor,
                                size: 96,
                              ),
                              Text(
                                'MALE',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: _selectedGender == Gender.male
                                      ? Colors.white
                                      : kInactiveColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        InputCard(
                          color: kCardBackgroundColor,
                          onTap: () {
                            selectGender(Gender.female);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.female,
                                color: _selectedGender == Gender.female
                                    ? Colors.white
                                    : kInactiveColor,
                                size: 96,
                              ),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: _selectedGender == Gender.female
                                      ? Colors.white
                                      : kInactiveColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  InputCard(
                    color: kCardBackgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "HEIGHT",
                          style: TextStyle(
                            color: kInactiveColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: [
                            Text(
                              height.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              ' cm',
                              style: TextStyle(
                                color: kInactiveColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: const SliderThemeData().copyWith(
                            trackHeight: 1,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: kInactiveColor,
                            thumbColor: kThemePinkColor,
                            overlayColor: kThemePinkAlphaColor,
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 14,
                            ),
                            trackShape: const RectangularSliderTrackShape(),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            onChanged: (value) {
                              setState(() {
                                height = value.toInt();
                              });
                            },
                            min: 30,
                            max: 250,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Row(
                      children: [
                        InputCard(
                          color: kCardBackgroundColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "WEIGHT",
                                style: TextStyle(
                                  color: kInactiveColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                weight.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  StyledButton(
                                    onTap: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                    text: '-',
                                  ),
                                  StyledButton(
                                    onTap: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    text: '+',
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        InputCard(
                          color: kCardBackgroundColor,
                          child: Column(
                            children: [
                              InputCard(
                                color: kCardBackgroundColor,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "AGE",
                                      style: TextStyle(
                                        color: kInactiveColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      age.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        StyledButton(
                                          onTap: () {
                                            setState(() {
                                              age--;
                                            });
                                          },
                                          text: '-',
                                        ),
                                        StyledButton(
                                          onTap: () {
                                            setState(() {
                                              age++;
                                            });
                                          },
                                          text: '+',
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ResultScreen(
                    calculation: Calculator(
                      height: height,
                      weight: weight,
                    ),
                  );
                }),
              );
            },
            child: Container(
              color: kThemePinkColor,
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "CALCULATE YOUR BMI",
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
