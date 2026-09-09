import 'package:flutter/material.dart';

class CalenderExample extends StatefulWidget {
  const CalenderExample({super.key});

  @override
  State<CalenderExample> createState() => _CalenderExampleState();
}

class _CalenderExampleState extends State<CalenderExample> {
  DateTime? data;

  // Function to pick a date using the showDatePicker dialog
  Future<void> pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      initialDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (!mounted || pickedDate == null) return;
    setState(() => data = pickedDate);
  }

  void SetCalenderValue() {
    setState(() {
      data = DateTime(2027, 10, 4);
    });
  }

  @override
  Widget build(BuildContext context) {
    final text = data == null
        ? 'No date selected'
        : 'Selected date: ${data!.day}/${data!.month}/${data!.year}';

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(text),
              ElevatedButton(
                onPressed: pickDate,
                child: const Text('Pick a Date'),
              ),
              ElevatedButton(
                onPressed: SetCalenderValue,
                child: const Text('Set a Date'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
