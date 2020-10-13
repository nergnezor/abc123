import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

int language = 1;

class GameObject {
  String _pathToFlr = "assets/animations/animals/";
  String _postFix = ".flr";
  String _animation = "Blink";

  GameObject({
    List<String> name,
    List<String> spokenName,
    String pathToSound,
    String nameOnFlareFile,
    GameObjectColor colorInfo,
  }) {
    _name = name;
    _spokenName = spokenName;
    _pathToSound = pathToSound;
    _flare = FlareActor("$_pathToFlr$nameOnFlareFile$_postFix",
        alignment: Alignment.center,
        fit: BoxFit.scaleDown,
        animation: _animation,
        color: null);
    _colorInfo = colorInfo;
  }

  get name => _name[language];
  get spokenName => _spokenName[language];
  get pathToSound => _pathToSound[language];
  get flare => _flare;
  get colorInfo => _colorInfo;
  get answered => _answered;
  set answered(bool answered) => this._answered = answered;

  ///Name
  List<String> _name;

  ///Spoken name
  List<String> _spokenName;

  ///Sound
  String _pathToSound;

  ///Color
  GameObjectColor _colorInfo;

  ///Image (svg)
  FlareActor _flare;

  bool _answered = false;

  //Tap Functionality
  //GestureDetector gd;

}

class GameObjectColor {
  String colorStr;
  Color color;
  GameObjectColor({List<String> colorStr, Color color});
}
