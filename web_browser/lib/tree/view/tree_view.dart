
import 'package:flutter/material.dart';
import 'package:web_browser/core/node/node.dart';
import 'package:web_browser/tree/view/components/tree_map/tree_map_view.dart';

class TreeView extends StatelessWidget {
  const TreeView(this.rootNode, {super.key});

  final Node rootNode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TreeMapView(),
        BackButton(),
      ],
    );
  }
}