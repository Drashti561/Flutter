import 'package:flutter/material.dart';
import 'package:flutter_application_1/controls/tabview.dart';
// import 'package:flutter_application_1/controls/gridview.dart';
// import 'package:flutter_application_1/controls/scrollviewimage.dart';
// import 'package:flutter_application_1/controls/imagesdisp.dart';
// import 'package:flutter_application_1/registration_form.dart';
// import 'package:flutter_application_1/controls/radioinput.dart';
// import 'package:flutter_application_1/controls/calenderExample.dart';
// import 'package:flutter_application_1/controls/textinput.dart';
// import 'package:flutter_application_1/controls/chkbox.dart';
// import 'package:flutter_application_1/controls/sliderExample.dart';
// import 'package:flutter_application_1/stopwatch/loginscreen.dart';
// import 'package:flutter_application_1/stopwatch/stopwatchexample.dart';

void main() {
  runApp(const StopwatchExample());
}

class StopwatchExample extends StatelessWidget {
  const StopwatchExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabExample(),
      // home: GridViewExample(),
      // home: ScrollImageDisp(),
      // home : ImageDisp(),
      // home: Registration(),
      // home: RadioExample(),
      // home: TextController(),
      // home: CalenderExample(),
      // home: SliderExample(),
      // home: ChkBOXDemo()
      // home: LoginWidget(),
      // home: MyStopwatch(),
    );
  }
}
