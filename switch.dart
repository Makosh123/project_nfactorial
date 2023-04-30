import 'package:flutter/material.dart';


class Switch extends StatefulWidget {
  final Offset position;
  final Color color;
  final List<Rect> gates;
  final Function(bool value) onChanged;
  final bool value;

  const Switch({
    required this.position,
    this.color = Colors.green,
    required this.gates,
    required this.onChanged,
    required this.value,
  });

  @override
  _SwitchState createState() => _SwitchState();
}

class _SwitchState extends State<Switch> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.position.dx,
      top: widget.position.dy,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _value = !_value;
          });
          widget.onChanged(_value);
        },
        child: CustomPaint(
          painter: SwitchPainter(
            color: widget.color,
            value: _value,
          ),
        ),
      ),
    );
  }
}

class SwitchPainter extends CustomPainter {
  final Color color;
  final bool value;

  SwitchPainter({required this.color, required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    canvas.drawCircle(Offset.zero, size.width / 2, paint);

    final innerSize = size.width * 0.8;
    final innerOffset = (size.width - innerSize) / 2;

    if (value) {
      paint.color = Colors.white;
      canvas.drawCircle(Offset.zero, innerSize / 2, paint);
    }

    paint.color = color;
    final rect = Rect.fromLTWH(-innerOffset, -innerOffset, innerSize, innerSize);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
