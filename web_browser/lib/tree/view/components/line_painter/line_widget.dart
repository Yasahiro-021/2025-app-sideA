import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/manager/line_manager.dart';

import 'line_painter.dart';

class LineWidget extends ConsumerWidget {
  const LineWidget({required this.path});

  final NodePath path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (Offset start, Offset end) = ref.watch(lineManagerProvider(path));
    return Positioned.fill(
      child: CustomPaint(
        painter: LinePainter(start: start, end: end),
      ),
    );
  }
}
