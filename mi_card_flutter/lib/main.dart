import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Center(
            child: Column(children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/pavlova.jpg'),
              ),
              Text(
                'Test TEST',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'SansPro',
                    color: Colors.teal.shade100,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
