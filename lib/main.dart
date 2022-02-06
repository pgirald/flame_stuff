import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart' hide Image;

class StreetAnimationExample extends FlameGame with TapDetector, PanDetector {
  late ParallaxLayer streetLayer;
  late SpriteAnimation cockroachAnimation;
  late SpriteAnimationComponent cockroach;
  SpriteAnimationComponent? currentRocket;
  final double normalSpeed = -600;
  final double increasedSpeed = -800;

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad
    await super.onLoad();
    cockroachAnimation = await loadSpriteAnimation(
        'cockroach.png',
        SpriteAnimationData.sequenced(
            amount: 4, stepTime: 0.1, textureSize: Vector2(47, 54)));
    cockroach = SpriteAnimationComponent(
        animation: cockroachAnimation,
        position: Vector2(size.x / 2 - 3, size.y - 10),
        anchor: Anchor.bottomCenter,
        size: Vector2(188, 196));
    streetLayer = await loadParallaxLayer(ParallaxImageData('street.png'),
        repeat: ImageRepeat.repeatY,
        velocityMultiplier: Vector2(0, normalSpeed),
        alignment: Alignment.center);
    final parallaxComponent = ParallaxComponent(
        parallax: Parallax([streetLayer], baseVelocity: Vector2(0, 1)),
        scale: Vector2(1.5, 1.5),
        anchor: Anchor.center);
    parallaxComponent.position = size / 2;
    add(parallaxComponent);
    add(cockroach);
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    if (currentRocket != null) {
      currentRocket!.position.y -= 8;
      if (currentRocket!.position.y < 0) {
        remove(currentRocket!);
        currentRocket = null;
      }
    }
  }

  @override
  void onTapDown(TapDownInfo info) async {
    // TODO: implement onTapDown
    super.onTapDown(info);
    if (currentRocket != null) {
      return;
    }
    final rocketAnimation = await loadSpriteAnimation(
        'rocket.png',
        SpriteAnimationData.sequenced(
            amount: 4, stepTime: 0.1, textureSize: Vector2(48, 416)));
    currentRocket = SpriteAnimationComponent(
        animation: rocketAnimation,
        size: Vector2(24, 208),
        anchor: Anchor.bottomCenter);

    currentRocket!.position =
        Vector2(cockroach.position.x, cockroach.topLeftPosition.y);
    add(currentRocket!);
  }

  @override
  void onTapUp(TapUpInfo info) {
    // TODO: implement onTapUp
    super.onTapUp(info);
    streetLayer.velocityMultiplier.y = normalSpeed;
    cockroachAnimation.stepTime = 0.1;
  }
}

void main() {
  final game = StreetAnimationExample();
  runApp(GameWidget(game: game));
}
