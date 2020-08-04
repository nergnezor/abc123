import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';

class MyCrate extends SpriteComponent {
  // creates a component that renders the crate.png sprite, with size 16 x 16
  MyCrate()
      : super.fromSprite(16.0, 16.0, new Sprite('StartScreenBackground.jpeg'));

  @override
  void resize(Size size) {
    // we don't need to set the x and y in the constructor, we can set then here
    this.x = (size.width - this.width) / 2;
    this.y = (size.height - this.height) / 2;
  }
}

class MyGame extends BaseGame {
  MyGame() {
    add(new MyCrate()); // this will call resize the first time as well
  }
}
