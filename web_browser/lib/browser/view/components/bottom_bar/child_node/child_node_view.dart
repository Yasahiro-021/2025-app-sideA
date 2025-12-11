import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/browser/view/components/bottom_bar/child_node/child_node_viewmodel.dart';


/// 子ノードを表示するボタン
class ChildNodeView extends ConsumerWidget {
  final NodePath nodePath;

  const ChildNodeView({
    super.key,
    required this.nodePath,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(childNodeViewModelProvider(nodePath));

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 0,
          maxWidth: 120,
        ),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            viewModel.navigateToNode();
          },
          child: Center(
            child: Text(
              viewModel.nodeName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ),
      ),
    );
  }
}
