import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Letters extends StatefulWidget {
  @override
  _LettersState createState() => _LettersState();
}

enum TtsState { playing, stopped, paused, continued }
final String alphabet = "abcdefghijklmnopqrstuvwxyz";

class _LettersState extends State<Letters> {
  FlutterTts flutterTts = FlutterTts();
  TtsState ttsState = TtsState.stopped;

  Future _speak(index) async {
    var result = await flutterTts.speak(alphabet[index]);
    if (result == 1) setState(() => ttsState = TtsState.playing);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.count(
        crossAxisCount: 10,
        children: List.generate(alphabet.length, (index) {
          // return Center(
          return FloatingActionButton(
            heroTag: index,
            onPressed: () => _speak(index),
            child: Text(
              alphabet[index],
              style: Theme.of(context).textTheme.headline5,
            ),
          );
        }),
      ),
    );
  }
}
