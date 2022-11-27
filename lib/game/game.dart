import 'package:dino_game/background.dart';
import 'package:flame/game.dart';

import '../dino.dart';

class DinoGame extends FlameGame {
  @override
  Future<void>? onLoad() async {
    await add(BackGround());
    add(DinoRun());
    return super.onLoad();
  }
}
