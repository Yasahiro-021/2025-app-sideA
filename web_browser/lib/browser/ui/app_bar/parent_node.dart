import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/notifiers/current_node_notifier.dart';
import 'package:web_browser/browser/browser_controller.dart';

class ParentNode extends ConsumerWidget {
  const ParentNode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentNode = ref.watch(currentNodeNotifierProvider);
    
    // 親ノードが存在するかチェック
    final parentNode = currentNode.parent;
    final hasParent = parentNode != null;
    
    return SizedBox(
      height: 36,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(40, 36),
          maximumSize: const Size(double.infinity, 36),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: hasParent ? () {
          ref.read(browserControllerProvider).navigateToParentNode();
        } : null,
        child: Text(
          hasParent ? (parentNode.name.isEmpty ? '(root)' : parentNode.name) : '(なし)',
          style: const TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}
