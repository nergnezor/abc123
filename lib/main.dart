import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'shape_match.dart';
import 'letters.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: ABC123(),
        // home: FindTheMatchingFruit(),
        debugShowCheckedModeBanner: false);
  }
}

Padding modeButton(context, StatefulWidget game, String s) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(s, style: TextStyle(fontSize: 25, color: Colors.white)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => game),
        );
      },
    ),
  );
}

Padding menuButton(context, String s) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text(s, style: TextStyle(fontSize: 25, color: Colors.white)),
        onPressed: () {
          if (isBackgroundMusicPlaying) {
            advancedPlayer?.pause();
            isBackgroundMusicPlaying = false;
          } else {
            advancedPlayer?.resume();
            isBackgroundMusicPlaying = true;
          }
        }),
  );
}

class ABC123 extends StatelessWidget {
  ABC123() {
    initMusic();

    //plyr.play('audio/backgorundMusic.mp3');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/StartScreenBackground.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              modeButton(context, FindTheMatchingFruit(MatchWith.emoji),
                  'Match emojis'),
              modeButton(context, FindTheMatchingFruit(MatchWith.letters),
                  'Match letters'),
              modeButton(context, Letters(), 'Speaking letters'),
              menuButton(context, "Toggle Music"),
            ],
          )),
        ),
      ),
    );
  }
}

initMusic() async {
  AudioPlayer.logEnabled = true;
  advancedPlayer = await plyr.loop('audio/backgorundMusic.mp3', volume: 0.25);
  isBackgroundMusicPlaying = true;
}

bool isBackgroundMusicPlaying = false;
AudioPlayer advancedPlayer = AudioPlayer();
AudioCache plyr = AudioCache(fixedPlayer: advancedPlayer);
