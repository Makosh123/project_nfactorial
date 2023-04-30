import 'package:flutter/material.dart' hide Switch;


import 'package:fireboy_and_watergirl/switch.dart' as fw_switch;
import 'package:flutter/material.dart' as material;

import 'package:fireboy_and_watergirl/switch.dart' as fbwg;

import 'package:fireboy_and_watergirl/switch.dart' as fw_switch;
import 'package:flutter/material.dart' as material;

import 'liquid.dart';
import 'player.dart';
import 'switch.dart';

class World {
  final Size size;
  final List<Player> players;
  final List<Rect> obstacles;
  final List<Switch> switches;
  final List<Liquid> liquids;
  final Rect goal;
  final void Function() onCompleted;

  World({
    required this.size,
    required this.players,
    required this.obstacles,
    required this.switches,
    required this.liquids,
    required this.goal,
    required this.onCompleted,
  });
}

class WorldPainter extends CustomPainter {
  final World world;

  WorldPainter(this.world);

  @override
  void paint(Canvas canvas, Size size) {
    // Рисуем игроков
    for (final player in world.players) {
      canvas.drawCircle(player.position, 10, Paint()..color = player.color);
    }

    // Рисуем препятствия
    for (final obstacle in world.obstacles) {
      canvas.drawRect(obstacle, Paint()..color = Colors.grey);
    }

    // Рисуем выключатели
    for (final switchObj in world.switches) {
      final paint = Paint()..color = switchObj.color;

      // Рисуем гейты
      for (final gate in switchObj.gates) {
        canvas.drawRect(gate, paint);
      }

      // Рисуем выключатель
      canvas.drawCircle(switchObj.position, 10, paint..style = PaintingStyle.stroke);
      if (switchObj.value) {
        canvas.drawCircle(switchObj.position, 6, paint..style = PaintingStyle.fill);
      }
    }

    // Рисуем жидкости
    for (final liquid in world.liquids) {
      canvas.drawRect(
        Rect.fromCenter(
          center: liquid.position,
          width: liquid.size.width,
          height: liquid.size.height,
        ),
        Paint()..color = liquid.color,
      );
    }

    // Рисуем финиш
    canvas.drawRect(world.goal, Paint()..color = Colors.yellow);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}