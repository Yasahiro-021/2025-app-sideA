import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/view/components/bottom_bar/stay_switch/stay_switch_view.dart';
import 'package:web_browser/browser/view/components/bottom_bar/bottom_node_list_view.dart';

/// ブラウザ画面の下部バー
class BrowserBottomBarView extends ConsumerWidget {
  const BrowserBottomBarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 32,
            maxHeight: 60,
          ),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StaySwitchView(),
              Expanded(
                child: BottomNodeListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
