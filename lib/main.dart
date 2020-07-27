import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/services.dart';

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
          fontFamily: 'PressStart',
        ),
        home: ABC123(),
        debugShowCheckedModeBanner: false);
  }
}

class ABC123 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Best Learning Game Ever'),
      ),*/
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/StartScreenBackground.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black)),
              child: Text('Play The Fruit Game'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FindTheMatchingFruit()),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class FindTheMatchingFruit extends StatefulWidget {
  FindTheMatchingFruit({Key key}) : super(key: key);

  createState() => FindTheMatchingFruitState();
}

Map getRandomEmojiList(int size, int startUnicode, int randomSeed) {
  Map choices = {};
  var random = new Random();
  for (int i = 0; i < size; ++i) {
    choices[String.fromCharCode(startUnicode + random.nextInt(randomSeed))] =
        Colors.green;
  }
  return choices;
}

class FindTheMatchingFruitState extends State<FindTheMatchingFruit> {
  /// Map to keep track of score
  final Map<String, bool> score = {};

  /// Choices for game
  // final Map choices = {
  //     final Map choices = {
  //   '🍏': Colors.green,
  //   '🍋': Colors.yellow,
  //   '🍅': Colors.red,
  //   '🍇': Colors.purple,
  //   '🥥': Colors.brown[300],
  //   '🥕': Colors.orange,
  //   '💩': Colors.brown,
  //   '👺': Colors.red[400],
  // };
  final Map choices = getRandomEmojiList(8, 0x1F400, 50);

  final fruitSuccessSounds = [
    'audio/mmm-1.wav',
    'audio/mmm-2.wav',
    'audio/mmm-3.wav'
  ];

  // Random seed to shuffle order of items.
  int seed = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Score ${score.length} /' + choices.length.toString()),
          backgroundColor: Colors.pink),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            score.clear();
            seed++;
          });
        },
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: choices.keys.map((emoji) {
                  return Draggable<String>(
                    data: emoji,
                    child: Emoji(emoji: score[emoji] == true ? '✅' : emoji),
                    feedback: Emoji(emoji: emoji),
                    childWhenDragging: Emoji(emoji: '🌱'),
                  );
                }).toList()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  choices.keys.map((emoji) => _buildDragTarget(emoji)).toList()
                    ..shuffle(Random(seed)),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDragTarget(emoji) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
        return Container(color: choices[emoji], height: 70, width: 70);
        /*try {
          return ColorFiltered(
            child: Emoji(emoji: emoji),
            colorFilter: ColorFilter.mode(Colors.grey,
                score[emoji] == true ? BlendMode.clear : BlendMode.srcIn),
          );
        } catch (e) {
          print("Error when applying ColorFilter " + e);
          return Container(color: choices[emoji], height: 70, width: 70);
        }*/
        /*ColorFiltered(
          child: Emoji(emoji: emoji),
          colorFilter: ColorFilter.mode(Colors.grey,
              score[emoji] == true ? BlendMode.clear : BlendMode.srcIn),
        );*/
      },
      onWillAccept: (data) => data == emoji,
      onAccept: (data) {
        setState(() {
          score[emoji] = true;
          plyr.play(fruitSuccessSounds[
              new Random().nextInt(fruitSuccessSounds.length)]);
        });
      },
      onLeave: (data) {},
    );
  }
}

class Emoji extends StatelessWidget {
  Emoji({Key key, this.emoji}) : super(key: key);

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 80,
        padding: EdgeInsets.all(10),
        child: Text(
          emoji,
          style: TextStyle(color: Colors.black, fontSize: 50),
        ),
      ),
    );
  }
}

AudioCache plyr = AudioCache();
