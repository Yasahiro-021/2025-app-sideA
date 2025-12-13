import 'package:flutter/material.dart';
import 'package:web_browser/core/node/node_path.dart';

/// グループ内に表示する個別ノード
class SimpleNodeView extends StatelessWidget {
  final NodePath nodePath;
  final double size;

  const SimpleNodeView({
    required this.nodePath,
    this.size = 40.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          nodePath.path.isEmpty ? 'R' : nodePath.path.last.toString(),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}
