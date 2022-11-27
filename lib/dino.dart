// ignore_for_file: unnecessary_this

import 'package:dino_game/assets.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

const double groundHeight = 34;

class DinoRun extends SpriteAnimationComponent {
  // late Vector2 _position;
  DinoRun()
      : super(
          size: Vector2(100, 100),
          // position: Vector2.all(100),
          // position: Vector2(200, 430),
        );
  @override
  Future<void>? onLoad() async {
    final image = await Flame.images.load(Assets.images.dinoSpritesMortPNG);
    animation = SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.range(
        start: 4,
        end: 11,
        amount: 24,
        textureSize: Vector2(24, 24),
        stepTimes: [
          0.1,
          0.1,
          0.1,
          0.1,
          0.1,
          0.1,
          0.1,
          0.1,
        ],
        // stepTime: 0.1,
        // loop: true,
      ),
    );
    // this.position = _position;

    return super.onLoad();
  }

  @override
  set size(Vector2 size) {
    // TODO: implement size
    super.size = size;

  
  }

  @override
  set position(Vector2 position) {
    position.x = 500;
    position.y = 430;
    super.position = position;
  }

  @override
  void onGameResize(Vector2 size) {

    
    // TODO: implement onGameResize
    super.onGameResize(size);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // position.x = width;
    // position.y = height * 6.0 - groundHeight;
  }
}

//0-3 idle
//4-10 run
//11-13 kick
//14-16 hit
//17-19 sprint

class DinoHit extends SpriteAnimationComponent {
  DinoHit()
      : super(
          size: Vector2(100, 100),
          position: Vector2(100, 100),
        );
  @override
  Future<void>? onLoad() async {
    final image = await Flame.images.load(Assets.images.dinoSpritesMortPNG);
    animation = SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.range(
        start: 14,
        end: 16,
        amount: 24,
        textureSize: Vector2(24, 24),
        stepTimes: [
          0.1,
          0.1,
          0.1,
        ],
        // stepTime: 0.1,
        // loop: true,
      ),
    );

    return super.onLoad();
  }
}
