import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';

class BasicParallaxExample extends FlameGame with TapDetector {
  late ParallaxComponent parallax;

  static const String description = '''
    Shows the simplest way to use a fullscreen `ParallaxComponent`.
  ''';

  final _imageNames = [
    ParallaxImageData('parallax/bg.png'),
    ParallaxImageData('parallax/mountain-far.png'),
    ParallaxImageData('parallax/mountains.png'),
    ParallaxImageData('parallax/trees.png'),
    ParallaxImageData('parallax/foreground-trees.png'),
    ParallaxImageData('doll.png')
  ];

  @override
  Future<void> onLoad() async {
    parallax = await loadParallaxComponent(
      _imageNames,
      baseVelocity: Vector2(20, 0),
      velocityMultiplierDelta: Vector2(1.8, 1.0),
    );
    add(parallax);
  }
}

void main() {
  final myGame = BasicParallaxExample();
  runApp(
    GameWidget(
      game: myGame,
    ),
  );
}
