import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart' hide Image;

class StreetAnimationExample extends FlameGame with TapDetector {
  late ParallaxLayer streetLayer;
  final double normalSpeed = -300;
  final double increasedSpeed = -500;

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad
    await super.onLoad();
    streetLayer = await loadParallaxLayer(ParallaxImageData('street.png'),
        repeat: ImageRepeat.repeatY,
        velocityMultiplier: Vector2(0, normalSpeed),
        alignment: Alignment.center);
    final parallaxComponent = ParallaxComponent(
        parallax: Parallax([streetLayer], baseVelocity: Vector2(0, 1)));
    add(parallaxComponent);
  }

  @override
  void onTapDown(TapDownInfo info) {
    // TODO: implement onTapDown
    super.onTapDown(info);
    streetLayer.velocityMultiplier.y = increasedSpeed;
  }

  @override
  void onTapUp(TapUpInfo info) {
    // TODO: implement onTapUp
    super.onTapUp(info);
    streetLayer.velocityMultiplier.y = normalSpeed;
  }

  @override
  void onTapCancel() {
    // TODO: implement onTapCancel
    super.onTapCancel();
    streetLayer.velocityMultiplier.y = normalSpeed;
  }
}

void main() {
  final game = StreetAnimationExample();
  runApp(GameWidget(game: game));
}
