import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/view/components/bottom_bar/stay_switch/stay_switch_viewmodel.dart';

/// 複数追加モードの切り替えスイッチ
class StaySwitchView extends ConsumerWidget {
  const StaySwitchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(staySwitchViewModelProvider.notifier);
    final state = ref.watch(staySwitchViewModelProvider);

    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Switch(
            value: state,
            onChanged: (v) {
              viewModel.toggleMultiAddEnabled();
            },
          ),
          const Text('ADD'),
        ],
      ),
    );
  }
}
