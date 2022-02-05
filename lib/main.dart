import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart' hide Image;

class IsometricTileMapExample extends FlameGame with TapDetector {
  late ParallaxLayer starsLayer;
  final double normalSpeed = -300;
  final double increasedSpeed = -500;
  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad
    await super.onLoad();
    starsLayer = await loadParallaxLayer(
        ParallaxAnimationData(
            'stars.png',
            SpriteAnimationData.sequenced(
                amount: 4, stepTime: 0.12, textureSize: Vector2(183, 108))),
        repeat: ImageRepeat.repeatY,
        fill: LayerFill.width,
        velocityMultiplier: Vector2(0, normalSpeed));
    final parallaxComponent = ParallaxComponent(
        parallax: Parallax([starsLayer], baseVelocity: Vector2(0, 1)));
    add(parallaxComponent);
  }

  @override
  void onTapDown(TapDownInfo info) {
    // TODO: implement onTapDown
    super.onTapDown(info);
    starsLayer.velocityMultiplier.y = increasedSpeed;
  }

  @override
  void onTapUp(TapUpInfo info) {
    // TODO: implement onTapUp
    super.onTapUp(info);
    starsLayer.velocityMultiplier.y = normalSpeed;
  }

  @override
  void onTapCancel() {
    // TODO: implement onTapCancel
    super.onTapCancel();
    starsLayer.velocityMultiplier.y = normalSpeed;
  }

  @override
  Color backgroundColor() => Colors.white12;
}

void main() {
  final game = IsometricTileMapExample();
  runApp(GameWidget(game: game));
}
