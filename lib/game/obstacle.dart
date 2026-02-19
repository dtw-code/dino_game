import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'dino_game.dart';

class Obstacle extends SpriteComponent with CollisionCallbacks {

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('cactus.png');

    size = Vector2(60, 80);

    final gameRef = findGame() as DinoGame;

    position = Vector2(
      gameRef.size.x,
      300,
    );

    add(
      RectangleHitbox.relative(
        Vector2(0.6, 0.8), // width %, height %
        parentSize: size,
        anchor: Anchor.center,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    final gameRef = findGame() as DinoGame;
    final currentSpeed = gameRef.gameSpeed;

    position.x -= currentSpeed * dt;

    if (position.x < -size.x) {
      removeFromParent();
    }
  }
}
