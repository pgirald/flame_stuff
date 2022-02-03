import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AnimationParallaxExample extends FlameGame {
  static const String description = '''
    Shows how to use animations in a `ParallaxComponent`.
  ''';

  @override
  Future<void> onLoad() async {
    final cityLayer = await loadParallaxLayer(
      ParallaxImageData('parallax/city.png'),
    );

    /*final rainLayer = await loadParallaxLayer(
      ParallaxAnimationData(
        'parallax/rain.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(80, 160),
        ),
      ),
      velocityMultiplier: Vector2(2, 0),
    );*/

    final rainLayer = await loadParallaxLayer(
      ParallaxAnimationData(
        'robot.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.1,
          textureSize: Vector2(16, 18),
        ),
      ),
      velocityMultiplier: Vector2(2, 0),
    );

    final cloudsLayer = await loadParallaxLayer(
      ParallaxImageData('parallax/heavy_clouded.png'),
      velocityMultiplier: Vector2(4, 0),
      fill: LayerFill.none,
      alignment: Alignment.topLeft,
    );

    final parallax = Parallax(
      [
        cityLayer,
        rainLayer,
        cloudsLayer,
      ],
      baseVelocity: Vector2(20, 0),
    );

    final parallaxComponent = ParallaxComponent(parallax: parallax);
    add(parallaxComponent);
  }
}

void main() {
  final myGame = AnimationParallaxExample();
  runApp(
    GameWidget(
      game: myGame,
    ),
  );
}
