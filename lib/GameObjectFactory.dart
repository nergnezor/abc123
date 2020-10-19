import 'package:flutter/material.dart';

import 'GameObject.dart';

class GameObjectFactory {
  static buildAnimalsList() {
    return [
      GameObject(
          name: ["Camel", "Kamel"],
          spokenName: ["a Camel", "en Kamel"],
          soundFilename: "",
          nameOnFlareFile: "Camel",
          colorInfo: GameObjectColor(
              colorStr: ["Yellow", "Gul"], color: Colors.yellow)),
      GameObject(
          name: ["Lion", "Lejon"],
          spokenName: ["a Lion", "ett Lejon"],
          soundFilename: "",
          nameOnFlareFile: "Lion",
          colorInfo: GameObjectColor(
              colorStr: ["Yellow", "Gul"], color: Colors.orange[400])),
      GameObject(
          name: ["Bear", "Björn"],
          spokenName: ["a Bear", "en Björn"],
          soundFilename: "",
          nameOnFlareFile: "Bear",
          colorInfo: GameObjectColor(
              colorStr: ["Brown", "Brun"], color: Colors.brown)),
      GameObject(
          name: ["Elephant", "Elefant"],
          spokenName: ["an Elephant", "en Elefant"],
          soundFilename: "",
          nameOnFlareFile: "Elephant",
          colorInfo:
              GameObjectColor(colorStr: ["Grey", "Grå"], color: Colors.grey)),
      GameObject(
          name: ["Pelican", "Pelikan"],
          spokenName: ["a Pelican", "en Pelikan"],
          soundFilename: "",
          nameOnFlareFile: "Pelican",
          colorInfo:
              GameObjectColor(colorStr: ["White", "Vit"], color: Colors.white)),
      GameObject(
          name: ["Kangaroo", "Känguru"],
          spokenName: ["a Kangaroo", "en Känggru"],
          soundFilename: "",
          nameOnFlareFile: "AngryKangaroo",
          colorInfo: GameObjectColor(
              colorStr: ["Brown", "Brun"], color: Colors.brown)),
      GameObject(
          name: ["Butterfly", "Fjäril"],
          spokenName: ["a Butterfly", "en Fjäril"],
          soundFilename: "",
          nameOnFlareFile: "ButterFly",
          colorInfo: GameObjectColor(
              colorStr: ["Yellow", "Gul"], color: Colors.blue[600])),
      GameObject(
          name: ["Cat", "Katt"],
          spokenName: ["a Cat", "en Katt"],
          soundFilename: "",
          nameOnFlareFile: "Cat",
          colorInfo: GameObjectColor(
              colorStr: ["Grey", "Grå"], color: Colors.grey[600])),
      GameObject(
          name: ["Dog", "Hund"],
          spokenName: ["a Dog", "en Hund"],
          soundFilename: "DogBark",
          nameOnFlareFile: "Dog",
          colorInfo: GameObjectColor(
              colorStr: ["Orange", "Orange"], color: Colors.orange[400])),
      GameObject(
          name: ["Snake", "Orm"],
          spokenName: ["a Snake", "en Orm"],
          soundFilename: "",
          nameOnFlareFile: "RedSnake",
          colorInfo:
              GameObjectColor(colorStr: ["Red", "Röd"], color: Colors.red)),
    ];
  }

  static get animals => buildAnimalsList();
}
