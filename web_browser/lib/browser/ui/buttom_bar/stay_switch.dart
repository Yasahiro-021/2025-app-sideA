import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/browser_controller.dart';

class StaySwitch extends ConsumerWidget {
  final bool multiAddEnabled;
  const StaySwitch({super.key, required this.multiAddEnabled});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Switch(
            value: multiAddEnabled,
            onChanged: (v) {
              ref.read(browserControllerProvider).toggleMultiAddEnabled();//TODO　Providerとの整合確認
            },
          ),
          const Text('ADD'),
        ],
      ),
    );
  }
}
