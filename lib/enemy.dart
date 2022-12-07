// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unnecessary_this

import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

import 'package:dino_game/assets.dart';
import 'package:dino_game/dino.dart';

import 'game/game.dart';

enum EnemyType { angryPig, bat, bee, blueBird }

class EnemyData {
  final String path;
  final double texturewidth;
  final double textureheight;
  final int amount;
  final double stepTime;
  final int? nRows;
  final int? nCols;

  EnemyData({
    required this.path,
    required this.texturewidth,
    required this.textureheight,
    required this.amount,
    required this.stepTime,
    this.nRows,
    this.nCols,
  });
}

class Enemy extends SpriteAnimationComponent with HasGameRef<DinoGame> {
  final EnemyType enemyType;
  static Map<EnemyType, EnemyData> enemyDataDetails = {
    EnemyType.angryPig: EnemyData(
      path: Assets.images.angryPig.run36X30PNG,
      texturewidth: 36,
      textureheight: 30,
      amount: 12,
      stepTime: 0.1,
    ),
    EnemyType.bat: EnemyData(
      path: Assets.images.bat.flying46X30PNG,
      texturewidth: 46,
      textureheight: 40,
      amount: 7,
      stepTime: 0.1,
    ),
    EnemyType.bee: EnemyData(
      path: Assets.images.bee.attack36X34PNG,
      texturewidth: 36,
      textureheight: 34,
      amount: 8,
      stepTime: 0.1,
    ),
    EnemyType.blueBird: EnemyData(
      path: Assets.images.blueBird.flying32X32PNG,
      texturewidth: 32,
      textureheight: 32,
      amount: 9,
      stepTime: 0.1,
    ),
  };

  double speed = 200;
  double texturewidth = 0;
  double textureheight = 0;

  Enemy(
    this.enemyType,
  ) : super(
          size: Vector2(100, 100),
          position: Vector2(100, 100),
        );
  @override
  Future<void>? onLoad() async {
    final enemyData = enemyDataDetails[enemyType]!;
    textureheight = enemyData.textureheight;
    texturewidth = enemyData.texturewidth;

    final image = await Flame.images.load(enemyData.path);
    animation = SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.sequenced(
        stepTime: enemyData.stepTime,

        amount: enemyData.amount,
        textureSize: Vector2(enemyData.texturewidth, enemyData.textureheight),

        // stepTime: 0.1,
        // loop: true,
      ),
    );

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    this.height = this.width = size.y / 5;

    // double scaleFactor = size.y / texturewidth;

    // this.height = textureheight * scaleFactor;
    // this.width = texturewidth * scaleFactor;

    this.x = this.width + size.x;

    this.y = size.y - this.height - groundHeight - 10;

    // y = size.y - groundHeight - height;
  }

  @override
  void update(double dt) {
    super.update(dt);

    this.x -= speed * dt;

    if (this.x < -this.width) {
      removeFromParent();
      //   this.x = this.gameRef.size.x;
    }
  }
}

class EnemySpawner extends Component with HasGameRef<DinoGame> {
  double time = 0.0;
  Timer? timer;
  int spwanedLevel = 0;

  EnemySpawner() {
    timer = Timer(4, repeat: true, onTick: () {
      spawnEnemy();
    });
  }

  void spawnEnemy() {
    final enemyType =
        EnemyType.values[Random().nextInt(EnemyType.values.length)];
    final enemy = Enemy(enemyType);
    gameRef.add(enemy);
  }

  @override
  void onMount() {
    super.onMount();

    timer?.start();
  }

  @override
  void update(double dt) {
    super.update(dt);
    timer!.update(dt);

    var newSpwanedLevel = (gameRef.score ~/ 500);

    if (spwanedLevel < newSpwanedLevel) {
      spwanedLevel = newSpwanedLevel;
      var newTime = (4 / (0.1 * spwanedLevel));

      timer!.stop();

      timer = Timer(newTime, repeat: true, onTick: () {
        spawnEnemy();
      });
      timer!.start();
    }
  }

  // @override
  // void update(double dt) {
  //   super.update(dt);

  //   time += dt;

  //   if (time >= interval) {
  //     time = 0.0;

  //     final enemyType =
  //         EnemyType.values[Random().nextInt(EnemyType.values.length)];

  //     gameRef.add(Enemy(enemyType));
  //   }
  // }
}
