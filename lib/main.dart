import 'package:flutter/material.dart';

import 'screens/covid_tracker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Covid Data",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CovidTracker(),
      ),
    );
  }
}
