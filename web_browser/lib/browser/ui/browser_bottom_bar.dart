import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ...existing code...
import 'package:web_browser/browser/ui/buttom_bar/stay_switch.dart';
import 'package:web_browser/browser/ui/buttom_bar/bottom_node_list.dart';
import 'package:web_browser/browser/notifiers/bottom_nodes_notifier.dart';
import 'package:web_browser/browser/notifiers/multi_add_enabled_notifier.dart';

class BrowserBottomBar extends ConsumerWidget {
  const BrowserBottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNodes = ref.watch(bottomNodesNotifierProvider);
    final multiAddEnabled = ref.watch(multiAddEnabledNotifierProvider);
    
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 32,
            maxHeight: 60,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StaySwitch(multiAddEnabled: multiAddEnabled),
              Expanded(
                child: BottomNodeList(bottomNodes: bottomNodes),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
