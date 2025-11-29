
import 'package:flutter/material.dart';
import 'package:web_browser/node/node.dart';

class TreeView extends StatelessWidget {
  const TreeView(this.rootNode, {super.key});

  final Node rootNode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text(
            'Tree Home View',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ],
    );
  }
}