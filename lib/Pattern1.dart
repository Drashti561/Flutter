import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Geometric Design",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
          ),

          body: Center(
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(
                  color: Colors.black,
                  width: 6,
                ),
              ),

              child: Stack(
                alignment: Alignment.center,
                children: [

                  // Orange Diamond
                  Transform.rotate(
                    angle: 0.785,
                    child: Container(
                      width: 230,
                      height: 230,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        border: Border.all(
                          color: Colors.black,
                          width: 5,
                        ),
                      ),
                    ),
                  ),

                  // Green Square
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(
                        color: Colors.black,
                        width: 5,
                      ),
                    ),
                  ),

                  // Blue Diamond
                  Transform.rotate(
                    angle: 0.785,
                    child: Container(
                      width: 115,
                      height: 115,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        border: Border.all(
                          color: Colors.black,
                          width: 5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
