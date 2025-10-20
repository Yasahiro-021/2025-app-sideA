import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:web_browser/browser/ui/buttom_bar/child_node.dart';
import 'package:web_browser/browser/browser_controller.dart';

class BottomNodeList extends ConsumerWidget {
  final List bottomNodes;
  const BottomNodeList({super.key, required this.bottomNodes});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (bottomNodes.isEmpty) {
      return SizedBox(
        height: 32, // 子ノードが無い場合は縮小した高さ
        child: Center(
          child: Text(
            '子ノードなし',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 12,
            ),
          ),
        ),
      );
    }
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: bottomNodes.length,
      itemBuilder: (context, index) {
        final node = bottomNodes[index];
        return GestureDetector(
          onTap: () {
            final controller = ref.read(browserControllerProvider);
            controller.changeNode(node);
            controller.webViewController?.loadUrl(
              urlRequest: URLRequest(url: WebUri(node.url)),
            );
          },
          child: Container(
            width: 150,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            child: Center(
              child: ChildNode(nodeName: node.name),
            ),
          ),
        );
      },
    );
  }
}
