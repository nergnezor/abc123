import 'package:flutter/material.dart';

import 'GameObject.dart';

class GameObjectFactory {
  static buildAnimalsList() {
    return [
      GameObject(
          name: ["Camel", "Kamel"],
          spokenName: ["a Camel", "en Kamel"],
          pathToSound: "",
          nameOnFlareFile: "Camel",
          colorInfo: GameObjectColor(
              colorStr: ["Yellow", "Gul"], color: Colors.yellow)),
      GameObject(
          name: ["Lion", "Lejon"],
          spokenName: ["a Lion", "ett Lejon"],
          pathToSound: "",
          nameOnFlareFile: "Lion",
          colorInfo: GameObjectColor(
              colorStr: ["Yellow", "Gul"], color: Colors.orange[400])),
      GameObject(
          name: ["Bear", "Björn"],
          spokenName: ["a Bear", "en Björn"],
          pathToSound: "",
          nameOnFlareFile: "Bear",
          colorInfo: GameObjectColor(
              colorStr: ["Brown", "Brun"], color: Colors.brown)),
      GameObject(
          name: ["Elephant", "Elefant"],
          spokenName: ["an Elephant", "en Elefant"],
          pathToSound: "",
          nameOnFlareFile: "Elephant",
          colorInfo:
              GameObjectColor(colorStr: ["Grey", "Grå"], color: Colors.grey)),
      GameObject(
          name: ["Pelican", "Pelikan"],
          spokenName: ["a Pelican", "en Pelikan"],
          pathToSound: "",
          nameOnFlareFile: "Pelican",
          colorInfo:
              GameObjectColor(colorStr: ["White", "Vit"], color: Colors.white)),
      GameObject(
          name: ["Kangaroo", "Känguru"],
          spokenName: ["a Kangaroo", "en Känguru"],
          pathToSound: "",
          nameOnFlareFile: "AngryKangaroo",
          colorInfo: GameObjectColor(
              colorStr: ["Brown", "Brun"], color: Colors.brown)),
      GameObject(
          name: ["Butterfly", "Fjäril"],
          spokenName: ["a Butterfly", "en Fjäril"],
          pathToSound: "",
          nameOnFlareFile: "ButterFly",
          colorInfo: GameObjectColor(
              colorStr: ["Yellow", "Gul"], color: Colors.orange[600])),
      GameObject(
          name: ["Bear", "Björn"],
          spokenName: ["a Bear", "en Björn"],
          pathToSound: "",
          nameOnFlareFile: "Bear",
          colorInfo: GameObjectColor(
              colorStr: ["Brown", "Brun"], color: Colors.brown)),
      GameObject(
          name: ["Elephant", "Elefant"],
          spokenName: ["an Elephant", "en Elefant"],
          pathToSound: "",
          nameOnFlareFile: "Elephant",
          colorInfo:
              GameObjectColor(colorStr: ["Grey", "Grå"], color: Colors.grey)),
      GameObject(
          name: ["Pelican", "Pelikan"],
          spokenName: ["a Pelican", "en Pelikan"],
          pathToSound: "",
          nameOnFlareFile: "Pelican",
          colorInfo:
              GameObjectColor(colorStr: ["White", "Vit"], color: Colors.white)),
      GameObject(
          name: ["Camel", "Kamel"],
          spokenName: ["a Camel", "en Kamel"],
          pathToSound: "",
          nameOnFlareFile: "Camel",
          colorInfo: GameObjectColor(
              colorStr: ["Yellow", "Gul"], color: Colors.yellow)),
      GameObject(
          name: ["Lion", "Lejon"],
          spokenName: ["a Lion", "ett Lejon"],
          pathToSound: "",
          nameOnFlareFile: "Lion",
          colorInfo: GameObjectColor(
              colorStr: ["Yellow", "Gul"], color: Colors.orange[400])),
      GameObject(
          name: ["Bear", "Björn"],
          spokenName: ["a Bear", "en Björn"],
          pathToSound: "",
          nameOnFlareFile: "Bear",
          colorInfo: GameObjectColor(
              colorStr: ["Brown", "Brun"], color: Colors.brown)),
      GameObject(
          name: ["Elephant", "Elefant"],
          spokenName: ["an Elephant", "en Elefant"],
          pathToSound: "",
          nameOnFlareFile: "Elephant",
          colorInfo:
              GameObjectColor(colorStr: ["Grey", "Grå"], color: Colors.grey)),
      GameObject(
          name: ["Pelican", "Pelikan"],
          spokenName: ["a Pelican", "en Pelikan"],
          pathToSound: "",
          nameOnFlareFile: "Pelican",
          colorInfo:
              GameObjectColor(colorStr: ["White", "Vit"], color: Colors.white)),
      GameObject(
          name: ["Camel", "Kamel"],
          spokenName: ["a Camel", "en Kamel"],
          pathToSound: "",
          nameOnFlareFile: "Camel",
          colorInfo: GameObjectColor(
              colorStr: ["Yellow", "Gul"], color: Colors.yellow)),
      GameObject(
          name: ["Lion", "Lejon"],
          spokenName: ["a Lion", "ett Lejon"],
          pathToSound: "",
          nameOnFlareFile: "Lion",
          colorInfo: GameObjectColor(
              colorStr: ["Yellow", "Gul"], color: Colors.orange[400])),
      GameObject(
          name: ["Bear", "Björn"],
          spokenName: ["a Bear", "en Björn"],
          pathToSound: "",
          nameOnFlareFile: "Bear",
          colorInfo: GameObjectColor(
              colorStr: ["Brown", "Brun"], color: Colors.brown)),
      GameObject(
          name: ["Elephant", "Elefant"],
          spokenName: ["an Elephant", "en Elefant"],
          pathToSound: "",
          nameOnFlareFile: "Elephant",
          colorInfo:
              GameObjectColor(colorStr: ["Grey", "Grå"], color: Colors.grey)),
      GameObject(
          name: ["Pelican", "Pelikan"],
          spokenName: ["a Pelican", "en Pelikan"],
          pathToSound: "",
          nameOnFlareFile: "Pelican",
          colorInfo:
              GameObjectColor(colorStr: ["White", "Vit"], color: Colors.white)),
    ];
  }

  static get animals => buildAnimalsList();
}
