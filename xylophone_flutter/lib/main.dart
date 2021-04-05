import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AudioCache cache = AudioCache();

    Expanded playSound(int soundNumber, MaterialColor color) {
      return Expanded(
        child: TextButton(
          onPressed: () {
            cache.play('note$soundNumber.wav');
          },
          // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
          style: TextButton.styleFrom(backgroundColor: color),
          child: null,
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                playSound(1, Colors.red),
                playSound(2, Colors.orange),
                playSound(3, Colors.yellow),
                playSound(4, Colors.green),
                playSound(5, Colors.teal),
                playSound(6, Colors.blue),
                playSound(7, Colors.purple),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
