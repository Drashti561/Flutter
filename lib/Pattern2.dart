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
              'My First Flutter App',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 247, 253, 252),
              ),
            ),
            backgroundColor: Colors.blue,
          ),
          body: Center(
            child: SizedBox(
              width: 250,
              height: 250,
              child: Stack(
                children: [

                  // Border
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 5,
                      ),
                    ),
                  ),

                  // Top Left
                  const Positioned(
                    top: 15,
                    left: 15,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),

                  // Top Right
                  const Positioned(
                    top: 15,
                    right: 15,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),

                  // Bottom Left
                  const Positioned(
                    bottom: 15,
                    left: 15,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),

                  // Bottom Right
                  const Positioned(
                    bottom: 15,
                    right: 15,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.black,
                      size: 35,
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
