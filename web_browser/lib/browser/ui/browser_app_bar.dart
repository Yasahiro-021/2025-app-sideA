import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/ui/app_bar/menu_button.dart';
import 'package:web_browser/browser/ui/app_bar/center_node_display.dart';
import 'package:web_browser/browser/ui/app_bar/tree_button.dart';

class BrowserAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const BrowserAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          MenuButton(),
          Expanded(child: CenterNodeDisplay()),
          TreeButton(),
        ],
      ),
    );
  }
}
