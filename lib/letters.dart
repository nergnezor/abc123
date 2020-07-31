import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class Letters extends StatefulWidget {
  @override
  _LettersState createState() => _LettersState();
}

enum TtsState { playing, stopped, paused, continued }
final String alphabet = "abcdefghijklmnopqrstuvwxyz";

class _LettersState extends State<Letters> {
  FlutterTts flutterTts = FlutterTts();
  dynamic languages;
  TtsState ttsState = TtsState.stopped;

  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();

    _getLanguages();

    if (!kIsWeb) {
      if (Platform.isAndroid) {
        _getEngines();
      }
    }
  }

  Future _getLanguages() async {
    languages = await flutterTts.getLanguages;
    if (languages != null) setState(() => languages);
  }

  Future _getEngines() async {
    var engines = await flutterTts.getEngines;
    if (engines != null) {
      for (dynamic engine in engines) {
        print('TTS engines' + engine);
      }
    }
  }

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
