import 'package:covid_data/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AssessmentTest extends StatefulWidget {
  const AssessmentTest({Key? key}) : super(key: key);

  @override
  State<AssessmentTest> createState() => _AssessmentTestState();
}

class _AssessmentTestState extends State<AssessmentTest> {
  int selectedValue = 0;
  List<String> symptoms = <String>[
    "Cough",
    "Fever",
    "Sore" "throat",
    "Chest congestion or runny nose",
    "Body ache",
    "Difficulty in Breathing",
    "Loss of senses of smell and taste",
    "Pink eyes",
    "Hearing impairment",
    "Gastrointestinal symptoms",
    "None of the Above",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Covid Tracker",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  height: 140,
                  width: 240,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade900,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(3)),
                  ),
                  child: const Text(
                    "Please note that your inuts will supplement the efforts being taken to contain the Corona pandemic and assess the Vaccination status and symptoms. Please help Aarogya Setu in helping India",
                    style: kButtonTextStyle,
                    softWrap: true,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  height: 60,
                  width: 240,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade900,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(3)),
                  ),
                  child: const Text(
                    "Are you currently experiencing any of the following symptoms?",
                    style: kButtonTextStyle,
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: symptoms.length,
                    itemBuilder: (_, i) {
                      return ListTile(
                        onTap: () {
                          setState(() {
                            selectedValue = i;
                          });
                        },
                        tileColor: Colors.white,
                        title: Text(
                          symptoms[i],
                          style: const TextStyle(color: Colors.blue),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
