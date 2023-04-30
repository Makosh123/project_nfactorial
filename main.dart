import 'package:flutter/material.dart';
import 'package:fireboy_and_watergirl/menu_screen.dart';
import 'package:fireboy_and_watergirl/level1.dart';
import 'package:fireboy_and_watergirl/level2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fireboy and Watergirl',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MenuScreen(),
        '/level1': (context) => const Level1(),
        '/level2': (context) => const Level2(),
      },
    );
  }
}

