import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../node/node_with_path.dart';
import 'browser_controller.dart';
import 'notifiers/current_node_notifier.dart';
import 'notifiers/root_node_notifier.dart';
import 'notifiers/bottom_nodes_notifier.dart';

///Webブラウザ画面のメインWidget
///
///UIの描画を担当
class BrowserViewWidget extends HookConsumerWidget {
  const BrowserViewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(browserControllerProvider);
    final currentNode = ref.watch(currentNodeNotifierProvider);
    final rootNode = ref.watch(rootNodeNotifierProvider);
    final bottomNodes = ref.watch(bottomNodesNotifierProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('ブラウザ'), // 画面タイトル
        actions: [
          // 履歴ツリー画面への遷移ボタン（UIは後ほど実装）
          IconButton(
            icon: const Icon(Icons.account_tree),
            onPressed: () {
              // TODO: TreeView画面への遷移を実装
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 親ノードへ戻るボタン表示条件
            if (currentNode.parent != null && currentNode != rootNode)
              ParentButton(parentNode: currentNode.parent as NodeWithPath?),
            // WebView本体（ページ表示）
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri(controller.initialUrl),
                ), // 初期URL
                initialSettings: controller.settings, // WebView設定
                onWebViewCreated:
                    controller.onWebViewCreated, // WebView生成時コールバック
                onLoadStop: controller.onLoadStop, // ページ読み込み完了時コールバック
                shouldOverrideUrlLoading:
                    controller.shouldOverrideUrlLoading, // リンククリック時コールバック
              ),
            ),
            // 下部履歴ボタンバー（履歴ノードが存在する場合のみ表示）
            if (bottomNodes.isNotEmpty)
              BrowserBottomBarNew(bottomNodes: bottomNodes),
          ],
        ),
      ),
    );
  }
}

/// 親ノードへ戻るボタンWidget
///
/// 親ノードが渡された場合にタップでき、遷移のプロバイダーを呼び出す
///
/// 親ノードが渡されなかった場合はバツ印と灰色になり、タップできない
class ParentButton extends ConsumerWidget {
  const ParentButton({super.key, this.parentNode});
  final NodeWithPath? parentNode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(browserControllerProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          if (parentNode != null) {
            // 親ノードに戻る
            controller.navigateToParentNode();
          }
        },
        child: Container(
          width: 160,
          height: 40,
          color: Colors.blue,
          alignment: Alignment.center,
          child: parentNode != null
              ? Text(
                  parentNode!.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              //親ノードがない場合はバツ印と灰色を表示
              : const Icon(Icons.cancel, color: Colors.grey),
        ),
      ),
    );
  }
}

/// 下部履歴ボタンバー（新アーキテクチャ用）
class BrowserBottomBarNew extends StatelessWidget {
  const BrowserBottomBarNew({super.key, required this.bottomNodes});
  final List<NodeWithPath> bottomNodes;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.grey[200],
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bottomNodes.length,
        itemBuilder: (context, index) {
          final node = bottomNodes[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // TODO: ノードタップ時の処理を実装
              },
              child: Text(
                node.name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        },
      ),
    );
  }
}
