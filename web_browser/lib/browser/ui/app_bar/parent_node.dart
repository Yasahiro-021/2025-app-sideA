import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/notifiers/current_node_notifier.dart';
import 'package:web_browser/browser/browser_controller.dart';

class ParentNode extends ConsumerWidget {
  const ParentNode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //状態の取得

    //TODO: 後ほど状態クラスを作成して統合する
    final bool isEmpty = true; // 仮の値
    final String parentName = "親ノード"; // 仮の値。空になりうる。
    final Function() buttonAction = () {}; // 仮の値

    return SizedBox(
      height: 36,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(40, 36),
          maximumSize: const Size(double.infinity, 36),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: hasParent
            ? () {
                ref.read(browserControllerProvider).navigateToParentNode();
              }
            : null,
        child: Text(
          isEmpty ? '(root)' : parentName,
          style: const TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}
