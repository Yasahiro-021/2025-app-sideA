import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/view/components/app_bar/current_node_text/current_node_text_viewmodel.dart';

/// 現在のノード名を表示
class CurrentNodeTextView extends ConsumerWidget {
  const CurrentNodeTextView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final viewModel = ref.watch(currentNodeTextViewModelProvider);

    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: colorScheme.onPrimaryContainer, width: 1),
            bottom: BorderSide(color: colorScheme.onPrimaryContainer, width: 0.1),
            left: BorderSide(color: colorScheme.onPrimaryContainer, width: 1),
            right: BorderSide(color: colorScheme.onPrimaryContainer, width: 1),
          ),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Text(
          viewModel.currentNodeName,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}
