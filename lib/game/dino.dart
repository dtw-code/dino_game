import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/services.dart';
import 'obstacle.dart';
import 'dino_game.dart';
import 'package:flame/sprite.dart';

class Dino extends SpriteAnimationComponent
    with HasGameRef<DinoGame>,
        KeyboardHandler,
        CollisionCallbacks {

  final double gravity = 1300;    //higher value lower gravity
  final double jumpForce = -600;  //lower value higher jump force
  double velocityY = 0;

  bool isOnGround = true;

  @override
  Future<void> onLoad() async {
    final image = await gameRef.images.load('runner.png');

    final spriteSheet = SpriteSheet(
      image: image,
      srcSize: Vector2(153, 204),
    );

    animation = spriteSheet.createAnimation(
      row: 0,
      stepTime: 0.08,
      to: 4,
    );

    size = Vector2(105, 140);

    final groundY = gameRef.size.y*0.69;

    position = Vector2(
      gameRef.size.x * 0.2,   // 20% from left
      groundY - size.y,
    );

    paint = Paint()..filterQuality = FilterQuality.none;

    add(
      RectangleHitbox.relative(
        Vector2(0.6, 0.8),
        parentSize: size,
        anchor: Anchor.center,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    velocityY += gravity * dt;
    position.y += velocityY * dt;

     final groundY = gameRef.size.y * 0.69;

    if (position.y >= groundY - size.y) {
      position.y = groundY - size.y;
      velocityY = 0;
      isOnGround = true;
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is Obstacle) {
      gameRef.gameOver();
    }
  }

  @override
  bool onKeyEvent(
      KeyEvent event,
      Set<LogicalKeyboardKey> keysPressed,
      ) {
    if (event is KeyDownEvent &&
        (event.logicalKey == LogicalKeyboardKey.space ||
            event.logicalKey == LogicalKeyboardKey.arrowUp)) {
      jump();
    }
    return true;
  }

  void jump() {
    if (isOnGround) {
      velocityY = jumpForce;
      isOnGround = false;

      // Pause animation while jumping (optional but cleaner)

    }
  }
}