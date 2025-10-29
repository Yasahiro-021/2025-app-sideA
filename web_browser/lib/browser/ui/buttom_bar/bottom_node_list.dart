import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:web_browser/browser/ui/buttom_bar/child_node.dart';
import 'package:web_browser/browser/browser_controller.dart';
import 'package:web_browser/node/node.dart';

class BottomNodeList extends ConsumerWidget {
  final List bottomNodes;
  const BottomNodeList({super.key, required this.bottomNodes});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List mockBottomNodes = [
      Node('Node 1aaaaaaaaaaaaaaa'),
      Node('Node 2'),
      Node('Node 3'),
      Node('Node 4'),
      Node('Node 5'),
    ];
    // if (bottomNodes.isEmpty) {
    if(mockBottomNodes.isEmpty) {
      return SizedBox(
        height: 32, // 子ノードが無い場合は縮小した高さ
        child: Center(
          child: Text(
            '子ノードなし',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 12,
            ),
          ),
        ),
      );
    }
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: mockBottomNodes.length,
      itemBuilder: (context, index) {
        final node = mockBottomNodes[index];
        return ChildNode(nodeName: node.name);
      },
    );
  }
}
