import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/services.dart';
import 'obstacle.dart';
import 'dino_game.dart';


class Dino extends SpriteComponent
    with KeyboardHandler, CollisionCallbacks {


  final double gravity = 1500;      //how fast it falls back
  final double jumpForce = -650;    //increase absolute jumpforce value to jump faster
  double velocityY = 0;

  bool isOnGround = true;

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('dino.png');

    size = Vector2(80, 80);
    final gameRef = findGame() as DinoGame;
    final groundY = gameRef.size.y - 10; // 80 = ground height

    position = Vector2(100, groundY - size.y);

    add(
      RectangleHitbox.relative(
        Vector2(0.7, 0.8),
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

    final gameRef = findGame() as DinoGame;
    final groundY = gameRef.size.y - 80; // ground height

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
      (findGame() as DinoGame).gameOver();
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
    }
  }
}
