import 'dart:math';

import 'package:dino_game/background.dart';
import 'package:dino_game/enemy.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

import '../dino.dart';

class DinoGame extends FlameGame with TapDetector {
  late Dino dinoRun;

  late TextComponent _scoreText;

  int score = 0;

  Random random = Random();
  @override
  Future<void>? onLoad() async {
    dinoRun = Dino();
    
    await add(BackGround());
    add(dinoRun);

    _scoreText = TextBoxComponent(text: "Score: $score")
      ..anchor = Anchor.topLeft
      ..x = 10
      ..y = 10;

    add(EnemySpawner());

    add(_scoreText);
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);
    dinoRun.jump();
  }

  @override
  void update(double dt) {
    super.update(dt);

    score += (60 * dt).toInt();
    _scoreText.text = "Score: " + score.toString();
  }
}
