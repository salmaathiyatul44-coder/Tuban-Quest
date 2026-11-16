import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class PlayerComponent extends PositionComponent {
  bool isMoving = false;
  final double speed = 150.0;

  PlayerComponent() : super(size: Vector2(40, 60));

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()..color = const Color(0xFFB85C38);
    canvas.drawRRect(
      RRect.fromRectAndRadius(size.toRect(), const Radius.circular(8)),
      paint,
    );

    final headPaint = Paint()..color = const Color(0xFF4A2C20);
    canvas.drawCircle(Offset(size.x / 2, 12), 10, headPaint);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (isMoving) {
      position.x += speed * dt;
    }
  }

  void moveRight() {
    isMoving = true;
  }

  void stop() {
    isMoving = false;
  }
}