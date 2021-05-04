import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    // Add LOW_LATENCY to avoid 'Attempt to perform seekTo in wrong state' error
    player.play('note$soundNumber.wav', mode: PlayerMode.LOW_LATENCY);
  }

  ButtonStyle flatButtonStyle(Color color) {
    return TextButton.styleFrom(
      backgroundColor: color,
      padding: EdgeInsets.all(0),
    );
  }

  Expanded buildKey({int soundNumber, Color color}) {
    return Expanded(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: color,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
          onPressed: () {
            playSound(soundNumber);
          },
          child: Text('')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildKey(color: Colors.blue[400], soundNumber: 1),
          buildKey(color: Colors.red[400], soundNumber: 2),
          buildKey(color: Colors.green[400], soundNumber: 3),
          buildKey(color: Colors.pink[400], soundNumber: 4),
          buildKey(color: Colors.indigo[400], soundNumber: 5),
          buildKey(color: Colors.purple[400], soundNumber: 6),
          buildKey(color: Colors.yellow[400], soundNumber: 7),
        ],
      ))),
    );
  }
}
