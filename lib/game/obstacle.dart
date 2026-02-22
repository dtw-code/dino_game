import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'dino_game.dart';


class Obstacle extends SpriteComponent
    with HasGameRef<DinoGame>, CollisionCallbacks {

  @override
  Future<void> onLoad() async {
    // Load orb sprite
    sprite = await gameRef.loadSprite('orb.png');

    // Keep original aspect ratio and scale down
    size = sprite!.srcSize * 0.15;

    // Use center anchor for proper positioning
    anchor = Anchor.center;

    // Ensure it renders above background/ground
    priority = 10;

    // Ground reference
    final groundY = gameRef.size.y * 0.66;

    // Spawn slightly above ground
    double reactionDistance = gameRef.gameSpeed * 1.2;
    position = Vector2(
      gameRef.size.x + reactionDistance,
      groundY - size.y / 2 - 20,
    );

    // Circular hitbox matching sprite
    add(
      CircleHitbox.relative(
        0.5,
        parentSize: size,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Move left like runner obstacle
    position.x -= gameRef.gameSpeed * dt;

    // Remove when off-screen
    if (position.x < -size.x) {
      removeFromParent();
    }
  }
}


// import 'package:flame/components.dart';
// import 'package:flame/collisions.dart';
// import 'package:flame/effects.dart';
// import 'package:flutter/material.dart';
// import 'dino_game.dart';
// import 'dart:math';
//
// class Obstacle extends CircleComponent
//     with HasGameRef<DinoGame>, CollisionCallbacks {
//
//   double baseY = 0;
//   double time = 0;
//   @override
//   Future<void> onLoad() async {
//     radius = 20;
//     anchor = Anchor.center;
//     paint = Paint()
//       ..color = Colors.limeAccent //const Color(0xFFFF1744)
//       ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
//
//     baseY = gameRef.size.y * 0.5;
//
//     position = Vector2(
//       gameRef.size.x + 40,
//       baseY,
//     );
//
//     add(CircleHitbox());
//   }
//
//
//   @override
//   void update(double dt) {
//     super.update(dt);
//
//     time += dt;
//
//     // Horizontal movement
//     position.x -= gameRef.gameSpeed * dt;
//
//     // Smooth oscillation
//     const amplitude = 25;     // how high it moves
//     const frequency = 2;      // speed of oscillation
//
//     position.y = baseY + amplitude * sin(time * frequency);
//
//     if (position.x < -50) {
//       removeFromParent();
//     }
//   }
// }