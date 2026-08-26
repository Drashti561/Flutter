import 'package:flutter/material.dart';
import 'dart:async';

class MyStopWatch extends StatefulWidget {
  const MyStopWatch({super.key});

  @override
  State<MyStopWatch> createState() => _MyStopWatchState();
}

class _MyStopWatchState extends State<MyStopWatch> {
  int seconds = 0;
  int milliseconds = 0;
  final laps = <int>[];

  late Timer timer;
  bool isRunning = false;

  void _lap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
      print(laps);
    });
  }

  void _clear() {
    setState(() {
      milliseconds = 0;
      laps.clear();
    });
  }

  void _startTimer() {
    if (!isRunning) {
      isRunning = true;
    }
  }

  void _stopTimer() {
    if (isRunning) {
      isRunning = false;
    }
  }

  void _onTick(Timer timer) {
    setState(() {
      if (isRunning) milliseconds += 100;
    });
  }
  
  Widget buildCounter(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Lap ${laps.length + 1}',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 10),
          Text(
            secondstotext(milliseconds),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildDisplay() {
    return ListView(
      children: [
        for (int millis in laps)
          ListTile(
            leading: const Icon(Icons.timer),
            title: Text(secondstotext(millis)),
            trailing: Text(
              'Lap ${laps.indexOf(millis) + 1}',
              style: const TextStyle(fontSize: 16),
            ),
          ),
      ],
    );
  }

  String secondstotext(millis) {
    final seconds = millis / 1000;
    return '$seconds seconds';
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 100), _onTick);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stopwatch Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Center(child: buildCounter(context))),
          const SizedBox(height: 20),
          Expanded(child: ControlPanel()),
          const SizedBox(height: 20),
          Expanded(child: _buildDisplay()),
        ],
      ),
    );
  }

  Row ControlPanel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all<Size>(const Size(60, 40)),
            padding: WidgetStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 8),
            ),
            backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
            foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          ),
          onPressed: _startTimer,
          child: const Text("Start"),
        ),

        const SizedBox(width: 8),
        ElevatedButton(
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all<Size>(const Size(60, 40)),
            padding: WidgetStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 8),
            ),
            backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
            foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          ),

          onPressed: _stopTimer,
          child: const Text("Stop"),
        ),

        const SizedBox(width: 8),
        ElevatedButton(
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all<Size>(const Size(60, 40)),
            padding: WidgetStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 8),
            ),
            backgroundColor: WidgetStateProperty.all<Color>(
              const Color.fromARGB(255, 243, 112, 5),
            ),
            foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          ),

          onPressed: _lap,
          child: const Text("Lap"),
        ),

        const SizedBox(width: 8),
        ElevatedButton(
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all<Size>(const Size(60, 40)),
            padding: WidgetStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 8),
            ),
            backgroundColor: WidgetStateProperty.all<Color>(
              const Color.fromARGB(255, 52, 125, 185),
            ),
            foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          ),

          onPressed: _clear,
          child: const Text("Clear"),
        ),

        // const SizedBox(width: 8),
        // IconButton(
        //   style: ButtonStyle(
        //     backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
        //     foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        //   ),
        //   onPressed: () {
        //     setState(() {
        //       milliseconds = 0;
        //     });
        //   },
        //   icon: const Icon(Icons.refresh),
        // ),
      ],
    );
  }
}
