import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ScoreText extends TextComponent {
  double score = 0;

  ScoreText()
      : super(
    position: Vector2(20, 20),
    text: 'Score: 0',
    textRenderer: TextPaint(
      style: const TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  @override
  void update(double dt) {
    super.update(dt);

    score += dt * 10; // Increase score over time
    text = 'Score: ${score.toInt()}';
  }

  void reset() {
    score = 0;
  }
}
