import 'dart:math';
import 'dart:io' show Platform;
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class FindALike extends StatefulWidget {
  //final MatchWith m;
  //const FindALike(this.m, {Key key}) : super(key: key);
  @override
  FindALikeState createState() => FindALikeState();
}

List<int> getTargetEmojiList(int size, int startUnicode, int randomSeed) {
  List<int> choices = new List();
  if (randomSeed < size) randomSeed = size;
  var random = new Random();
  for (int i = 0; i < size; ++i) {
    //   var emoji = String.fromCharCode(startUnicode + random.nextInt(randomSeed));
    //   while (choices.containsKey(emoji))
    //     emoji = String.fromCharCode(startUnicode + random.nextInt(randomSeed));
    //   choices[emoji] = Colors.green;

    choices.add(random.nextInt(randomSeed));
  }
  return choices;
}

List<int> getRandomEmojiList(int size, int startUnicode, int randomSeed) {
  List<int> choices = new List();
  if (randomSeed < size) randomSeed = size;
  var random = new Random();
  for (int i = 0; i < size; ++i) {
    //   var emoji = String.fromCharCode(startUnicode + random.nextInt(randomSeed));
    //   while (choices.containsKey(emoji))
    //     emoji = String.fromCharCode(startUnicode + random.nextInt(randomSeed));
    //   choices[emoji] = Colors.green;
    int seed = random.nextInt(randomSeed);
    if (!targetObject.contains(seed) || choices.contains(seed)) {
      choices.add(seed);
    } else {
      i--;
    }
  }
  choices.add(targetObject[0]);
  return choices;
}

enum MatchWith { emoji, letters }
List<int> targetObject;

class FindALikeState extends State<FindALike> {
  /// Map to keep track of score
  // final Map<String, bool> score = {};
  final int startUnicode = 0x1F400;
  final double fontSizeOfTarget = 200;
  List<int> choices;

  FindALikeState() {
    generateTargetAndCoices();
  }

  void generateTargetAndCoices() {
    targetObject = getTargetEmojiList(1, 0x1F400, 60);
    choices = getRandomEmojiList(6, 0x1F400, 60);
  }

  final Map<int, bool> score = {};

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
        title: Text('Score ${score.length} /' + targetObject.length.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            generateTargetAndCoices();
            score.clear();
            seed++;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/LandscapeBackground.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: targetObject.map((i) {
                    return Draggable<String>(
                      data: getCharacter(i),
                      child: Emoji(
                          emoji: score[i] == true ? '✅' : getCharacter(i),
                          fontSize: fontSizeOfTarget),
                      feedback: Emoji(
                          emoji: getCharacter(i), fontSize: fontSizeOfTarget),
                      childWhenDragging: Emoji(
                        emoji: '🌱',
                        fontSize: fontSizeOfTarget,
                      ),
                    );
                  }).toList()),
              SizedBox(
                width: 450,
                height: 450,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,

                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("HEJ"),
                      Text("hej")
                    ] /*choices.map((i) => _buildDragTarget(i)).toList()
                      ..shuffle(Random(seed))*/
                    ,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getCharacter(int i) => String.fromCharCode(startUnicode + i);

  Widget _buildDragTarget(i) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
        try {
          if (Platform.isAndroid || Platform.isIOS)
            return Emoji(emoji: getCharacter(i));
          /*,ColorFiltered(
              child: Emoji(emoji: getCharacter(i)),
              colorFilter: ColorFilter.mode(Colors.black,
                  score[i] == true ? BlendMode.clear : BlendMode.srcIn),
            );*/
        } catch (e) {}
        return Container(color: Colors.grey, height: 80, width: 80);
      },
      onWillAccept: (data) => data == getCharacter(i),
      onAccept: (data) {
        setState(() {
          score[i] = true;
          plyr.play(fruitSuccessSounds[
              new Random().nextInt(fruitSuccessSounds.length)]);
        });
      },
      onLeave: (data) {},
    );
  }
}

class Emoji extends StatelessWidget {
  Emoji({Key key, this.emoji, this.fontSize}) : super(key: key);

  final String emoji;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        // height: 80,
        padding: EdgeInsets.all(10),
        child: Text(
          emoji,
          style: TextStyle(
              color: Colors.black,
              fontSize: (fontSize == null) ? 160 : fontSize),
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
      ),
    );
  }
}

AudioCache plyr = AudioCache();
