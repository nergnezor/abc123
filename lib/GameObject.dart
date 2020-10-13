import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class GameObject {
  ///Name
  List<String> name;

  ///Spoken name
  List<String> spokenName;

  ///Sound
  String pathToSound;

  ///Color
  GameObjectColor colorInfo;

  ///Image (svg)
  FlareActor pathToFlare;

  //Tap Functionality
  //GestureDetector gd;

  GameObject(this.name, this.spokenName, this.pathToFlare, this.colorInfo,
      this.pathToSound);
}

class GameObjectColor {
  String colorStr;
  Colors color;
  GameObjectColor(this.colorStr, this.color);
}
