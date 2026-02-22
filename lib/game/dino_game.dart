import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flame/collisions.dart';
import 'package:flame/camera.dart';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'dart:math';
import 'ground.dart';
import 'score_text.dart';
import 'dino.dart';
import 'obstacle.dart';

enum GameState { ready, playing, gameOver }
late ScoreText scoreText;
class DinoGame extends FlameGame
    with HasKeyboardHandlerComponents,
        HasCollisionDetection,
        TapCallbacks {

  late Dino dino;

  double gameSpeed = 180;
  final double acceleration = 20;

  double spawnTimer = 0;
  double spawnInterval = 2;

  GameState state = GameState.ready;



  @override
  Future<void> onLoad() async {
    camera.viewport = MaxViewport();


    final bg = await loadSprite('background.png');

    add(
      SpriteComponent(
        sprite: bg,
        size: size, // match your viewport
        position: Vector2.zero(),
      ),
    );

    add(Ground(gameSize: size));

    dino = Dino();
    add(dino);

    //add(Ground());


    scoreText = ScoreText();
    add(scoreText);

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

    spawnInterval = (2 - (gameSpeed / 1000)).clamp(0.8, 2);
    spawnInterval += (Random().nextDouble() * 0.3);

    spawnTimer += dt;

    if (spawnTimer >= spawnInterval) {
      spawnTimer = 0;

      if (children.whereType<Obstacle>().length < 2) {
        add(Obstacle());
      }
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

    gameSpeed = 150;
    spawnTimer = 0;
    spawnInterval = 2; // add this
    scoreText.reset();
    state = GameState.playing;

    resumeEngine();

  }
}
