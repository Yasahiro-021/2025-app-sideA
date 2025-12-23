import 'package:flutter/material.dart';

import 'line_painter.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({super.key, required this.start, required this.end});
  final Offset start;
  final Offset end;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: CustomPaint(
        painter: LinePainter(start: start, end: end),
      ),
    );
  }
}
