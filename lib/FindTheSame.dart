import 'dart:math';
import 'package:abc2/GameObject.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'Tts.dart';
import 'package:abc2/GameObjectFactory.dart';
import 'size_config.dart';

List<GameObject> localGameList = GameObjectFactory.buildAnimalsList();

int numberOfTargets = 1;
int numberOfChoices = 7;
int numberObjectsOnRow = 0;

class FindTheSame extends StatefulWidget {
  //final MatchWith m;
  //const FindTheSame(this.m, {Key key}) : super(key: key);
  @override
  FindTheSameState createState() => FindTheSameState();
}

List<GameObject> getTargetGameObjectList(int size, int randomSeed) {
  List<GameObject> choices = new List();
  var random = new Random();

  for (int i = 0; i < size; ++i) {
    choices.add(localGameList[random.nextInt(randomSeed)]);
  }

  return choices;
}

List<GameObject> getRandomGameObjectsList(int size, int randomSeed) {
  List<GameObject> choices = new List();
  if (size > randomSeed) size = randomSeed;
  choices.addAll(targetObject);

  var random = new Random();
  while (choices.length < size) {
    GameObject seedObject = localGameList[random.nextInt(randomSeed)];
    if (!targetObject.contains(seedObject) && !choices.contains(seedObject)) {
      choices.add(seedObject);
    }
  }

  return choices..shuffle(Random(randomSeed));
}

enum MatchWith { emoji, letters }
List<GameObject> targetObject;
List<GameObject> choices;

class FindTheSameState extends State<FindTheSame> {
  /// Map to keep track of score
  // final Map<String, bool> score = {};
  final double fontSizeOfTarget = 200;
  GameObjectFactory gf = GameObjectFactory();
  FindTheSameState() {
    generateTargetAndCoices();
  }
  @override
  void initState() {
    Tts.speak("Hitta lika! Klicka på djuret som det finns två av");

    super.initState();
  }

  void generateTargetAndCoices() {
    localGameList = GameObjectFactory.buildAnimalsList();
    targetObject =
        getTargetGameObjectList(numberOfTargets, localGameList.length);
    choices = getRandomGameObjectsList(numberOfChoices, localGameList.length);
  }

  final Map<int, bool> score = {};
  int rightChoices = 0;

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
        backgroundColor: Colors.blue[300],
        title: Text('Score: $rightChoices'),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  height: (30 * SizeConfig.blockSizeVertical),
                  width: SizeConfig.screenWidth,
                  child: targetObject[0].flare),
              Container(
                color: Colors.red,
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.fromLTRB(
                    0 /*(SizeConfig.screenWidth * 0.005)*/, 0, 0, 0),
                child: Wrap(
                    alignment: WrapAlignment.spaceAround,
                    children: //[choices[0].flare],
                        List.generate(numberOfChoices, (index) {
                      return GestureDetector(
                        onTap: () {
                          print(choices[index].name);
                          // if (choices[index].answered) return;
                          if (choices[index].name == targetObject[0].name) {
                            //choices[index].answered = true;
                            rightChoices++;
                            Tts.speak(
                                "Bra! Det är ${choices[index].spokenName}.");
                            setState(() {
                              generateTargetAndCoices();
                            });
                          } else {
                            setState(() {
                              rightChoices = 0;
                            });

                            Tts.speak("Nej det är inte samma");
                          }
                        },
                        child: Container(
                          child: SizedBox(
                            height: (numberOfChoices < 5)
                                ? (25 * SizeConfig.blockSizeVertical)
                                : (35 *
                                    SizeConfig.blockSizeVertical /
                                    (numberOfChoices / 5)),
                            width: SizeConfig.screenWidth / 5.61,
                            child: Card(
                              elevation: 5.0,
                              color: choices[index].color,
                              child: choices[index].flare,
                            ),
                          ),
                        ),
                      );
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }

  //var _dimension = 400.0;
  /* @override
  Widget build(BuildContext context) {
    if (_dimension > MediaQuery.of(context).size.width - 10.0) {
      _dimension = MediaQuery.of(context).size.width - 10.0;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("SVGS"),
      ),
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Slider(
                min: 5.0,
                max: MediaQuery.of(context).size.width - 10.0,
                value: _dimension,
                onChanged: (double val) {
                  setState(() => _dimension = val);
                }),
            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 8 ,
                //maxCrossAxisExtent: _dimension,
                padding: const EdgeInsets.all(4.0),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                children: SVGs.painters.toList(),
                childAspectRatio: 1.0,
              ),
            ),
          ]),
    );
  }*/

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
