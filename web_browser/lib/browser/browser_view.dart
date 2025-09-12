import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../node/node.dart';
import 'browser_controller.dart';
import 'browser_bottom_bar.dart';

///Webブラウザ画面のメインWidget
///
///UIの描画を担当
class BrowserViewWidget extends HookConsumerWidget {
  const BrowserViewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = BrowserController(); // コントローラー初期化
    return Scaffold(
      appBar: AppBar(
        title: const Text('ブラウザ'), // 画面タイトル
        actions: [
          // 履歴ツリー画面への遷移ボタン
          IconButton(
            icon: const Icon(Icons.account_tree),
            onPressed: () => controller.openTreeView(context),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 親ノードへ戻るボタン表示条件をgetRootNodeで統一
            if (controller.parentNode != null &&
                controller.currentNode != controller.getRootNode)
              ParentButton(),
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
                //shouldOverrideUrlLoading: controller.shouldOverrideUrlLoading, // もともとあったやつ。
                shouldOverrideUrlLoading:
                    controller.shouldOverrideUrlLoadingRoot, // リンククリック時コールバック
              ),
            ),
            // 下部履歴ボタンバー（履歴ノードが存在する場合のみ表示）
            if (controller.bottomNodes.isNotEmpty)
              BrowserBottomBar(controller: controller),
          ],
        ),
      ),
      bottomNavigationBar: BrowserBottomBar(controller: controller),
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
  final Node? parentNode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () => ref
            .read(browserControllerProvider)
            .navigateToParentNode(), // 親ノードのURLに遷移
        child: Container(
          width: 160,
          height: 40,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            parentNode != null
                ? 
                : '',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildFloatingButtons(
  BuildContext context,
  void Function(void Function()) setState,
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      // --- WebViewの履歴を戻るボタン ---
      // FloatingActionButtonを押すとWebViewの「戻る」履歴があれば1つ戻る
      FloatingActionButton(
        heroTag: "backButton",
        child: const Icon(Icons.arrow_back),
        onPressed: () async {
          // WebViewに戻れる履歴がある場合のみ戻る
          if (await webViewController.canGoBack()) {
            await webViewController.goBack();
          }
        },
      ),
      const SizedBox(height: 16),
      // --- ノード追加切替スイッチ ---
      // Rowで2つの操作（切替ボタンとスイッチ）を横並びに表示
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // ノード追加切替用のFloatingActionButton
          // アイコンはON/OFFでチェックボックス表示が変わる
          FloatingActionButton(
            heroTag: "addChildNodeSwitch",
            onPressed: () {
              // ボタン押下で履歴ノード追加のON/OFFを切り替える
              setState(() {
                canAddChildNode = !canAddChildNode;
              });
            },
            child: Icon(
              canAddChildNode ? Icons.check_box : Icons.check_box_outline_blank,
            ),
          ),
          const SizedBox(width: 12),
          // ノード追加切替用のSwitch（ON/OFF状態を視覚的に表示・変更）
          Switch(
            value: canAddChildNode,
            onChanged: (value) {
              // スイッチ操作で履歴ノード追加のON/OFFを切り替える
              setState(() {
                canAddChildNode = value;
              });
            },
          ),
        ],
      ),
    ],
  );
}
