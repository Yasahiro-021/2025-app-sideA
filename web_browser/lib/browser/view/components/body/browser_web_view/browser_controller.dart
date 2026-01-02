import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/view_model/notifiers/current_path_notifier.dart';
import 'package:web_browser/browser/view_model/notifiers/multi_add_enabled_notifier.dart';
import 'package:web_browser/browser/view_model/notifiers/search_url_provider.dart';
import 'package:web_browser/core/node/browser_node.dart';
import 'package:web_browser/core/node/browser_node_from_path_notifier.dart';
import 'package:web_browser/core/usecase/create_node_usecase.dart';

/// WebViewイベントの処理とナビゲーション制御を行う
class BrowserController {
  final WidgetRef ref;

  BrowserController(this.ref);

  /// WebViewの各種設定（JavaScript有効化など）
  final InAppWebViewSettings settings = InAppWebViewSettings(
    javaScriptEnabled: true,
    useShouldOverrideUrlLoading: true,
  );

  /// 検索用URL（アプリ起動時に最初に表示するURL）
  String get searchUrl => ref.read(searchUrlProvider);

  /// URLかどうか判定
  bool isGoogleUrl(String url) => url.startsWith(searchUrl);

  /// WebView生成時に呼ばれるコールバック
  void onWebViewCreated(InAppWebViewController controller) {}

  /// ページ読み込み完了時に呼ばれるコールバック
  void onLoadStop(InAppWebViewController controller, WebUri? loadedUrl) async {
    if (loadedUrl == null) return;
    final urlStr = loadedUrl.toString();
    final currentPath = ref.read(currentPathProvider);

    // ページタイトル取得
    String? title = await controller.getTitle();
    final pageTitle = (title != null && title.isNotEmpty) ? title : urlStr;

    // 現在のノードを更新
    ref
        .read(browserNodeFromPathProvider(currentPath).notifier)
        .setNode(BrowserNode(title: pageTitle, url: urlStr));
  }

  /// リンククリック時に呼ばれるコールバック
  Future<NavigationActionPolicy?> shouldOverrideUrlLoading(
    InAppWebViewController controller,
    NavigationAction navigationAction,
  ) async {
    final bool isMultiAddEnabled = ref.read(multiAddEnabledProvider);
    // マルチ追加モードが有効な場合、ナビゲーションをキャンセルし、子に追加
    if (isMultiAddEnabled) {
      final currentPath = ref.read(currentPathProvider);
      final urlStr = navigationAction.request.url.toString();
      
      final String title = navigationAction.request.url?.host ?? urlStr;
      final newNode = BrowserNode(title: title, url: urlStr);
      final WebUri? uri = navigationAction.request.url;

      // //wikipediaのURLの場合、タイトルをパスから生成する
      // final bool isWikipediaUrl =
      //     uri != null && (uri.host.contains('wikipedia.org'));
      // final BrowserNode nodeToCreate = isWikipediaUrl
      //     ? BrowserNode(
      //     title: Uri.decodeComponent(
      //       uri.pathSegments
      //       .lastWhere(
      //         (segment) => segment.isNotEmpty,
      //         orElse: () => uri.host
      //       )
      //       .replaceAll('_', ' '),
      //     ),
      //     url: urlStr,
      //   )
      //     : newNode;

      ref
          .read(createNodeUsecaseProvider)
          .create(parentPath: currentPath, node: newNode);
      return NavigationActionPolicy.CANCEL;
    } else {
      return NavigationActionPolicy.ALLOW;
    }
  }
}
