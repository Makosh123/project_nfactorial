import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fireboy_and_watergirl/player.dart';
import 'package:fireboy_and_watergirl/world.dart';

class Level2 extends StatefulWidget {
  const Level2({Key? key}) : super(key: key);

  @override
  _Level2State createState() => _Level2State();
}

class _Level2State extends State<Level2> {
  late Player fireboy;
  late Player watergirl;
  late World world;

  @override
  void initState() {
    super.initState();

    // Create players and world
    fireboy = Player(
      name: 'Fireboy',
      position: const Offset(100, 100),
      color: Colors.red,
      controls: {
        'up': LogicalKeyboardKey.arrowUp,
        'left': LogicalKeyboardKey.arrowLeft,
        'right': LogicalKeyboardKey.arrowRight,
        'down': LogicalKeyboardKey.arrowDown,
      },
    );

    watergirl = Player(
      name: 'Watergirl',
      position: const Offset(300, 100),
      color: Colors.blue,
      controls: {
        'up': LogicalKeyboardKey.keyW,
        'left': LogicalKeyboardKey.keyA,
        'right': LogicalKeyboardKey.keyD,
        'down': LogicalKeyboardKey.keyS,
      },
    );

    world = World(
      size: const Size(400, 400),
      players: [fireboy, watergirl],
      obstacles: [
        Rect.fromLTWH(0, 200, 400, 20),
        Rect.fromLTWH(200, 0, 20, 400),
      ],
      switches: [
        Switch(
          position: const Offset(50, 50),
          color: Colors.green,
          gates: [
            Rect.fromLTWH(0, 0, 20, 200),
            Rect.fromLTWH(0, 200, 200, 20),
          ],
          onChanged: (value) {
            setState(() {
              // Update world state when switch is toggled
              world.updateSwitch(0, value);
            });
          },
        ),
        Switch(
          position: const Offset(350, 350),
          color: Colors.orange,
          gates: [
            Rect.fromLTWH(200, 380, 200, 20),
            Rect.fromLTWH(380, 0, 20, 200),
          ],
          onChanged: (value) {
            setState(() {
              // Update world state when switch is toggled
              world.updateSwitch(1, value);
            });
          },
        ),
      ],
      liquids: [
        Liquid(
          position: const Offset(0, 240),
          size: const Size(200, 160),
          color: Colors.green.withOpacity(0.5),
        ),
        Liquid(
          position: const Offset(200, 0),
          size: const Size(200, 160),
          color: Colors.orange.withOpacity(0.5),
        ),
      ],
      goal: Rect.fromLTWH(180, 180, 40, 40),
      onCompleted: () {
        showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            title: Text('Level completed!'),
            content: Text('Congratulations!'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fireboy and Watergirl'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
       
