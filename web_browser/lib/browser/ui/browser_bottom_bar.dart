import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:web_browser/browser/ui/buttom_bar/child_node.dart';
import 'package:web_browser/browser/notifiers/bottom_nodes_notifier.dart';
import 'package:web_browser/browser/notifiers/multi_add_enabled_notifier.dart';
import 'package:web_browser/browser/browser_controller.dart';

class BrowserBottomBar extends ConsumerWidget {
  const BrowserBottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNodes = ref.watch(bottomNodesNotifierProvider);
    final multiAddEnabled = ref.watch(multiAddEnabledNotifierProvider);
    final controller = ref.watch(browserControllerProvider);
    
    return SafeArea(
      child: Container(
        height: 100,
        padding: const EdgeInsets.only(left: 16, bottom: 16),
        child: Row(
          children: [
            // STAYスイッチ（左寄せ・通常サイズ）
            Container(
              margin: const EdgeInsets.only(right: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Switch(
                    value: multiAddEnabled,
                    onChanged: (v) {
                      controller.toggleMultiAddEnabled();
                    },
                  ),
                  const Text('STAY'),
                ],
              ),
            ),
            // 子ノードボタン（スクロール可能）
            Expanded(
              child: bottomNodes.isEmpty
                  ? Center(
                      child: Text(
                        '子ノードなし',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: bottomNodes.length,
                      itemBuilder: (context, index) {
                        final node = bottomNodes[index];
                        return GestureDetector(
                          onTap: () {
                            // 子ノードをタップしたときの処理
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
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
