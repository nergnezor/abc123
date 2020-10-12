import 'package:flutter/material.dart';

class GameObject {
  ///TODO
  ///Name
  String name;

  ///Spoken name
  String spokenName;

  ///Sound
  String pathToSound;

  ///Color
  GameObjectColor color;

  ///Image (svg)
  String pathToSVG;
}

class GameObjectColor {
  String colorStr;
  Colors color;
}
