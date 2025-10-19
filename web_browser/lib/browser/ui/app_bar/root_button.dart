import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/notifiers/root_node_notifier.dart';
import 'package:web_browser/browser/browser_controller.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class RootButton extends ConsumerWidget {
  const RootButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(browserControllerProvider);
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(
        icon: const Icon(Icons.account_tree),
        onPressed: () {
          final rootNode = ref.read(rootNodeNotifierProvider);
          controller.changeNode(rootNode);
          controller.webViewController?.loadUrl(
            urlRequest: URLRequest(url: WebUri(rootNode.url)),
          );
        },
      ),
    );
  }
}
