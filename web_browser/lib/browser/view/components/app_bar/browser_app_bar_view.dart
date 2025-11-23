import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/view/components/app_bar/menu_button_view.dart';
import 'package:web_browser/browser/view/components/app_bar/center_node_display_view.dart';
import 'package:web_browser/browser/view/components/app_bar/tree_button/tree_button_view.dart';

/// ブラウザ画面のAppBar
class BrowserAppBarView extends ConsumerWidget implements PreferredSizeWidget {
  const BrowserAppBarView({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MenuButtonView(),
          Expanded(child: CenterNodeDisplayView()),
          TreeButtonView(),
        ],
      ),
    );
  }
}
