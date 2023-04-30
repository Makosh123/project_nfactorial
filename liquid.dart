import 'dart:ui';

import 'package:flutter/material.dart';

class Liquid {
  final Offset position;
  final Size size;
  final Color color;

  Liquid({
    required this.position,
    required this.size,
    required this.color,
  });

  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(position.dx, position.dy, size.width, size.height),
      Paint()..color = color,
    );
  }

  bool contains(Offset point) {
    return Rect.fromLTWH(position.dx, position.dy, size.width, size.height)
        .contains(point);
  }
}
