import 'package:dino_game/background.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

import '../dino.dart';

class DinoGame extends FlameGame with TapDetector {
  late DinoRun dinoRun;
  @override
  Future<void>? onLoad() async {
    dinoRun = DinoRun();
    await add(BackGround());
    add(dinoRun);
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);
    dinoRun.jump();
  }
}
