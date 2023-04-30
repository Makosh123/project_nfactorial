import 'package:flutter/material.dart';
import 'package:fireboy_and_watergirl/world.dart';
import 'package:fireboy_and_watergirl/player.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key, required this.world}) : super(key: key);

  final World world;

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Player fireboy;
  late Player watergirl;

  @override
  void initState() {
    super.initState();

    fireboy = widget.world.players.firstWhere((player) => player.name == 'Fireboy');
    watergirl = widget.world.players.firstWhere((player) => player.name == 'Watergirl');
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
            // Обновляем положение игроков
            fireboy.move(details.delta);
            watergirl.move(details.delta);
          });
        },
        child: CustomPaint(
          size: widget.world.size,
          painter: WorldPainter(widget.world),
        ),
      ),
    );
  }
}
