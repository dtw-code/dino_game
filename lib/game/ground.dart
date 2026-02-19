import 'package:flame/components.dart';
import 'dino_game.dart';

class Ground extends PositionComponent {


  late SpriteComponent ground1;
  late SpriteComponent ground2;

  @override
  Future<void> onLoad() async {
    final sprite = await Sprite.load('ground.png');
    final groundHeight = 80.0;
    ground1 = SpriteComponent(
      sprite: sprite,
      size: Vector2(findGame()!.size.x, groundHeight),
      position: Vector2(0, findGame()!.size.y - groundHeight),
    );

    ground2 = SpriteComponent(
      sprite: sprite,
      size: Vector2(findGame()!.size.x, groundHeight),
      position: Vector2(
        findGame()!.size.x,
        findGame()!.size.y - groundHeight,
      ),
    );


    add(ground1);
    add(ground2);
  }

  @override
  void update(double dt) {
    @override
    void update(double dt) {
      super.update(dt);

      final gameRef = findGame() as DinoGame;
      final currentSpeed = gameRef.gameSpeed;

      ground1.position.x -= currentSpeed * dt;
      ground2.position.x -= currentSpeed * dt;

      if (ground1.position.x <= -ground1.size.x) {
        ground1.position.x = ground2.position.x + ground2.size.x;
      }

      if (ground2.position.x <= -ground2.size.x) {
        ground2.position.x = ground1.position.x + ground1.size.x;
      }
    }

  }
}
