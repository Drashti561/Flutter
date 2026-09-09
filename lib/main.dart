import 'package:flutter/material.dart';
import 'package:flutter_application_1/stopwatch/loginscreen.dart';
import 'package:flutter_application_1/stopwatch/stopwatchexample.dart';

void main() {
  runApp(const StopwatchExample());
}

class StopwatchExample extends StatelessWidget {
  const StopwatchExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginWidget(),
      // home: MyStopwatch(),
    );
  }
}
