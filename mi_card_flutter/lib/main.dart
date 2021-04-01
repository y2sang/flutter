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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                color: Colors.red,
                child: Text('Container 1'),
              ),
              Container(
                width: 100,
                color: Colors.teal,
                child: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.yellow,
                    child: Text('Container 2'),
                  ),
                ),
              ),
              Container(
                width: 100,
                color: Colors.blue,
                child: Text('Container 3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
