import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'game/dino_game.dart';
import 'package:dino_game/game/game_overlay.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      GameWidget<DinoGame>(
        game: DinoGame(),
        overlayBuilderMap: {
          'Start': (context, game) =>
              StartOverlay(onStart: game.startGame),
          'GameOver': (context, game) =>
              GameOverOverlay(onRestart: game.resetGame),
        },
      )
  );
}
