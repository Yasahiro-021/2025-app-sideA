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
    //カラースキームの取得
    final colors = Theme.of(context).colorScheme;

    // ルートノードの監視
    final rootNode = ref.watch(rootNodeNotifierProvider);

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Text('ツリー', style: Theme.of(context).textTheme.labelSmall),

          IconButton.filled(
            iconSize: 35,
            padding: EdgeInsets.all(2), // 余白を小さく
            constraints: const BoxConstraints(), // デフォルトの最小サイズ制約を解除
            icon: const Icon(Icons.account_tree),
            style: IconButton.styleFrom(
              foregroundColor: colors.onPrimary,
              padding: EdgeInsets.all(2), // こちらにも指定
              tapTargetSize: MaterialTapTargetSize.shrinkWrap, // タップ領域も小さく
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            tooltip: 'ツリー画面へ移動',
            onPressed: () {
              // ツリー画面への遷移
              TreeViewRoute($extra: rootNode).push(context);
            },
          ),
        ],
      ),
    );
  }
}
