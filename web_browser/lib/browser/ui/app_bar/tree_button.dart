import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/notifiers/root_node_notifier.dart';
import 'package:web_browser/router/router.dart';

/// ツリー画面への遷移ボタン
///
/// ルートノードをextraパラメータとして渡してツリー画面へ遷移する
class TreeButton extends ConsumerWidget {
  const TreeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rootNode = ref.watch(rootNodeNotifierProvider);

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Container(
            color: Colors.red,
            child: Text('ツリー', style: Theme.of(context).textTheme.labelSmall),
          ),
          Container(
            color: Colors.blue,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.account_tree),
              style: IconButton.styleFrom(
                foregroundColor: Colors.white,
              ) ,
              tooltip: 'ツリー画面へ移動',
              onPressed: () {
                // ツリー画面への遷移
                TreeViewRoute($extra: rootNode).push(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
