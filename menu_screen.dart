import 'package:flutter/material.dart';
import 'package:fireboy_and_watergirl/level1.dart';
import 'package:fireboy_and_watergirl/level2.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fireboy and Watergirl'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Level1()),
                );
              },
              child: const Text('Level 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Level2()),
                );
              },
              child: const Text('Level 2'),
            ),
          ],
        ),
      ),
    );
  }
}
