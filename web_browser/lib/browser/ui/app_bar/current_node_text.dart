import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/notifiers/current_node_notifier.dart';

class CurrentNodeText extends ConsumerWidget {
  const CurrentNodeText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    
    final currentNodeName = "current";//TODO 後ほど状態クラスを作成して統合する

    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: colorScheme.onPrimaryContainer, width: 1),
            bottom: BorderSide(color: colorScheme.onPrimaryContainer, width: 0.1), //下部は非表示  
            left: BorderSide(color: colorScheme.onPrimaryContainer, width: 1),
            right: BorderSide(color: colorScheme.onPrimaryContainer, width: 1),
          ),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Text(
          currentNodeName,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}
