import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class Letters extends StatefulWidget {
  @override
  _LettersState createState() => _LettersState();
}

enum TtsState { playing, stopped, paused, continued }

class _LettersState extends State<Letters> {
  FlutterTts flutterTts = FlutterTts();
  dynamic languages;
  TtsState ttsState = TtsState.stopped;

  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() async {
    flutterTts = FlutterTts();

    _getLanguages();

    //flutterTts.setLanguage(language)

    await flutterTts.setLanguage("sv");

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
    var result = await flutterTts.speak(alphabetLetter(index).toLowerCase());
    if (result == 1) setState(() => ttsState = TtsState.playing);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/StartScreenBackground.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: GridView.count(
            crossAxisCount: 9,
            children: List.generate(alphabetLength(), (i) {
              return GestureDetector(
                child: Center(
                    child: Text(alphabetLetter(i),
                        style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Colors.accents[
                                Random().nextInt(Colors.accents.length)]))),
                onTap: () => _speak(i),
              );
            }),
          ),
        ),
      ),
    );
  }
}

int alphabetLength() => 'z'.codeUnits.first - 'a'.codeUnits.first + 1;
String alphabetLetter(index) {
  return String.fromCharCode('a'.codeUnits.first + index).toUpperCase();
}
