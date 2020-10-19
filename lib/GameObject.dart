import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

int language = 1;

class GameObject {
  static AudioCache _soundPlayer = AudioCache();
  String _pathToFlr = "assets/animations/animals/";
  String _postFix = ".flr";
  String _animation = "Blink";

  String _pathToAnimalsSounds = "audio/AnimalSounds/";
  String _audioPostFix = ".mp3";

  GameObject({
    List<String> name,
    List<String> spokenName,
    String soundFilename,
    String nameOnFlareFile,
    GameObjectColor colorInfo,
  }) {
    _name = name;
    _spokenName = spokenName;
    //_pathToSound = (soundFilename == "") ? "" : "$soundFilename";
    if (soundFilename != "") {
      _hasSound = true;
      _soundFileName = soundFilename;
      soundPlayer.load(_pathToAnimalsSounds + _soundFileName + _audioPostFix);
    }
    _flare = FlareActor("$_pathToFlr$nameOnFlareFile$_postFix",
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: _animation,
        color: null);
    _colorInfo = colorInfo;
  }

  get name => _name[language];
  get spokenName => _spokenName[language];
  get pathToSound => _soundFileName;
  get flare => _flare;
  get color => _colorInfo._color.withOpacity(0.5);
  get colorStr => _colorInfo._colorStr;
  get answered => _answered;
  get soundPlayer => _soundPlayer;
  get hasSound => _hasSound;
  set answered(bool answered) => this._answered = answered;

  ///Name
  List<String> _name;

  ///Spoken name
  List<String> _spokenName;

  ///Sound
  String _soundFileName;

  ///Color
  GameObjectColor _colorInfo;

  ///Image (svg)
  FlareActor _flare;

  bool _answered = false;

  bool _hasSound = false;

  void playSound() {
    if (_hasSound) {
      try {
        _soundPlayer
            .play(_pathToAnimalsSounds + _soundFileName + _audioPostFix);
      } on Exception {
        print("Could not play audio");
      }
    }
  }

  //Tap Functionality
  //GestureDetector gd;

}

class GameObjectColor {
  List<String> _colorStr;
  Color _color;
  GameObjectColor({List<String> colorStr, Color color}) {
    _color = color;
    _colorStr = colorStr;
  }
  get color => _color;
  get colorStr => _colorStr;
}
