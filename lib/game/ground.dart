import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'dart:math';
//
// class Ground extends RectangleComponent {
//   Ground({required Vector2 gameSize})
//       : super(
//     size: Vector2(gameSize.x, 8),
//     position: Vector2(0, gameSize.y * 0.65),
//     paint: Paint()
//       ..color = const Color(0xFF76eaf5)
//       ..maskFilter =
//       const MaskFilter.blur(BlurStyle.normal, 1),
//   );
// }




class Ground extends RectangleComponent {
  double _time = 0;

  final Color colorA = const Color(0xFF00F5FF); // cyan
  final Color colorB = const Color(0xFF15065c); // electric blue  Color(0xFF0066FF);

  Ground({required Vector2 gameSize})
      : super(
    size: Vector2(gameSize.x, 12),
    position: Vector2(0, gameSize.y * 0.65),
    paint: Paint()
      ..color = const Color(0xFF00F5FF)
      ..maskFilter =
      const MaskFilter.blur(BlurStyle.normal, 3),
  );

  @override
  void update(double dt) {
    super.update(dt);

    _time += dt;

    // value goes from 0 → 1 smoothly
    double t = (sin(_time * 3) + 1) / 2;

    paint.color = Color.lerp(colorA, colorB, t)!
      ..withAlpha(255);
  }
}