import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Player {
  final String name;
  final Color color;
  final Map<String, LogicalKeyboardKey> controls;
  late Offset position;
  late Offset velocity;

  Player({
    required this.name,
    required this.color,
    required this.controls,
    Offset? position,
    Offset? velocity,
  }) {
    this.position = position ?? Offset.zero;
    this.velocity = velocity ?? Offset.zero;
  }

  void move(Offset delta) {
    velocity += delta;
  }

  void update(double dt) {
    position += velocity * dt;
    velocity *= 0.8;
  }

  Rect get rect => Rect.fromCenter(
        center: position,
        width: 20,
        height: 20,
      );

  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(position, 10, Paint()..color = color);
  }
}
