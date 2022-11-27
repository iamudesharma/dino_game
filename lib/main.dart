import 'package:dino_game/assets.dart';
import 'package:dino_game/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();

  final game = DinoGame();

  runApp(GameWidget(game: game));
}

  
