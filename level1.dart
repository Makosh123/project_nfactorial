
import 'package:fireboy_and_watergirl/liquid.dart';
import 'package:flutter/material.dart' as material;
import 'package:fireboy_and_watergirl/player.dart';
import 'package:fireboy_and_watergirl/world.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Level1 extends StatefulWidget {
  const Level1({Key? key}) : super(key: key);

  @override
  _Level1State createState() => _Level1State();
}

class _Level1State extends State<Level1> {
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
    fbwg.Switch(
          position: Offset(50, 50),
          color: Colors.green,
          gates: [
            Rect.fromLTWH(0, 0, 20, 200),
            Rect.fromLTWH(0, 200, 200, 20),
          ],
        ),
        fbwg.Switch(
          position: const Offset(350, 350),
          color: Colors.orange,
          gates: [
            Rect.fromLTWH(200, 380, 200, 20),
            Rect.fromLTWH(380, 0, 20, 200),
          ],
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
        onPanUpdate: (details) {
          setState(() {
            // Update player positions
            fireboy.move(details.delta);
            watergirl.move(details.delta);
          });
        },
        child: CustomPaint(
          size: world.size,
          painter: WorldPainter(world),
        ),
      ),
    );
  }
}
