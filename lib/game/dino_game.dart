import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flame/collisions.dart';
import 'package:flame/camera.dart';
import 'package:flutter/material.dart';

import 'ground.dart';
import 'score_text.dart';
import 'dino.dart';
import 'obstacle.dart';

enum GameState { ready, playing, gameOver }

class DinoGame extends FlameGame
    with HasKeyboardHandlerComponents,
        HasCollisionDetection,
        TapCallbacks {

  late Dino dino;

  double gameSpeed = 250;
  final double acceleration = 20;

  double spawnTimer = 0;
  double spawnInterval = 2;

  GameState state = GameState.ready;

  @override
  Color backgroundColor() => const Color(0xFFFFFFFF);

  @override
  Future<void> onLoad() async {
    camera.viewport = FixedResolutionViewport(
      resolution: Vector2(800, 450),
    );

    await images.loadAll([
      'dino.png',
      'ground.png',
      'cactus.png',
    ]);

    dino = Dino();
    add(dino);

    add(Ground());
    add(ScoreText());

    pauseEngine();
    overlays.add('Start');
  }

  @override
  void onTapDown(TapDownEvent event) {
    if (state == GameState.ready) {
      startGame();
    } else if (state == GameState.playing) {
      dino.jump();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (state != GameState.playing) return;

    gameSpeed += acceleration * dt;

    spawnInterval = 2 - (gameSpeed / 1000);
    spawnInterval = spawnInterval.clamp(0.8, 2);

    spawnTimer += dt;

    if (spawnTimer >= spawnInterval) {
      spawnTimer = 0;
      add(Obstacle());
    }
  }

  void startGame() {
    overlays.remove('Start');
    state = GameState.playing;
    resumeEngine();
  }

  void gameOver() {
    state = GameState.gameOver;
    pauseEngine();
    overlays.add('GameOver');
  }

  void resetGame() {
    children.whereType<Obstacle>().forEach((o) => o.removeFromParent());

    overlays.remove('GameOver');

    gameSpeed = 250;
    spawnTimer = 0;
    state = GameState.playing;

    resumeEngine();

  }
}
