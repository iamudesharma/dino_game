// ignore_for_file: unnecessary_this

import 'dart:math';

import 'package:dino_game/assets.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

const double groundHeight = 46;

class DinoRun extends SpriteAnimationComponent {
  double speedY = 0.0;
  double yMax = 0.0;

  double gravity = 1000.0;

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
  void onGameResize(Vector2 size) {
    this.height = this.width = size.y / 5;

    this.x = this.width;

    this.y = size.y - this.height - groundHeight;

    yMax = this.y;

    y = size.y - groundHeight - height;
    super.onGameResize(size);
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (y < yMax) {
      speedY += gravity * dt;
      y += speedY * dt;
    } else {
      y = yMax;
    }

    this.y += speedY * dt;
    if (isOnGround()) {
      this.y = yMax;
      speedY = 0.0;
    }
  }

  void jump() {
    this.speedY = -300;
  }

  bool isOnGround() {
    return (this.y >= yMax);
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
