import 'package:flutter/material.dart';

class PauseMenu extends StatelessWidget {
  final Function onRestartPressed;
  final Function onResumePressed;
  final Function onQuitPressed;

  PauseMenu(_gameScreenState, {
    required this.onRestartPressed,
    required this.onResumePressed,
    required this.onQuitPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "PAUSED",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: onRestartPressed as void Function()?,
            child: Text("RESTART"),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: onResumePressed as void Function()?,
            child: Text("RESUME"),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: onQuitPressed as void Function()?,
            child: Text("QUIT"),
          ),
        ],
      ),
    );
  }
}
