import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/view/components/bottom_bar/child_node/child_node_view.dart';
import 'package:web_browser/browser/view_model/notifiers/bottom_nodes_notifier.dart';

/// 下部バーの子ノードリスト
class BottomNodeListView extends ConsumerWidget {
  const BottomNodeListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNodes = ref.watch(bottomNodesNotifierProvider);

    if (bottomNodes.isEmpty) {
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
      itemCount: bottomNodes.length,
      itemBuilder: (context, index) {
        final node = bottomNodes[index];
        return ChildNodeView(node: node);
      },
    );
  }
}
