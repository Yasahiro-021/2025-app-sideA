import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/notifiers/current_node_notifier.dart';

class CurrentNodeText extends ConsumerWidget {
  const CurrentNodeText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentNode = ref.watch(currentNodeNotifierProvider);

    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          currentNode.name.isEmpty ? '(root)' : currentNode.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}
