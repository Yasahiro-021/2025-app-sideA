import 'package:flutter/material.dart';

class ParentNode extends StatelessWidget {
  final String nodeName;

  const ParentNode({super.key, required this.nodeName});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        nodeName,
        style: TextStyle(fontSize: 16),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
