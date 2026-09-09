import 'package:flutter/material.dart';

class TextController extends StatefulWidget {
  const TextController({super.key});

  @override
  State<TextController> createState() => _TextControllerState();
}

class _TextControllerState extends State<TextController> {
  final textController = TextEditingController();
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void setText() {
    setState(() {
      textController.text = 'Hello World';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'Enter text here',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
            ),
            Text('Read Text: ${textController.text}'),
            ElevatedButton(
              onPressed: setText,
              child: const Text('Set Text'),
            ),
          ],
        ),
      ),
    );
  }
}