import 'dart:developer';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'model/node_with_path.dart';
import 'view_model/notifiers/root_node_notifier.dart';
import 'view_model/notifiers/current_node_notifier.dart';
import 'view_model/notifiers/url_titles_notifier.dart';
import 'view_model/notifiers/bottom_nodes_notifier.dart';
import 'view_model/notifiers/webview_controller_notifier.dart';
import 'view_model/notifiers/multi_add_enabled_notifier.dart';
import 'view_model/notifiers/search_word_notifier.dart';

/// ブラウザの状態と操作を集約して提供するコントローラークラス
///
/// 各状態管理Notifierを統合し、WebViewイベントの処理とナビゲーション制御を行う
class BrowserViewModel {
  final Ref ref;

  BrowserViewModel(this.ref) {
    // currentNodeの変更を監視してbottomNodesを更新
    ref.listen<NodeWithPath>(currentNodeNotifierProvider, (previous, next) {
      _updateBottomNodesFromCurrentNode(next);
    });
  }

  /// 各Notifierへのアクセス
  RootNodeNotifier get rootNodeNotifier =>
      ref.read(rootNodeNotifierProvider.notifier);
  CurrentNodeNotifier get currentNodeNotifier =>
      ref.read(currentNodeNotifierProvider.notifier);
  UrlTitlesNotifier get urlTitlesNotifier =>
      ref.read(urlTitlesNotifierProvider.notifier);
  BottomNodesNotifier get bottomNodesNotifier =>
      ref.read(bottomNodesNotifierProvider.notifier);
  WebViewControllerNotifier get webViewControllerNotifier =>
      ref.read(webViewControllerNotifierProvider.notifier);
  MultiAddEnabledNotifier get multiAddEnabledNotifier =>
      ref.read(multiAddEnabledNotifierProvider.notifier);
  SearchWordNotifier get searchWordNotifier =>
      ref.read(searchWordNotifierProvider.notifier);

  /// 状態の取得
  NodeWithPath get rootNode => ref.read(rootNodeNotifierProvider);
  NodeWithPath get currentNode => ref.read(currentNodeNotifierProvider);
  Map<String, String> get urlTitles => ref.read(urlTitlesNotifierProvider);
  List<NodeWithPath> get bottomNodes =>
      ref.read(bottomNodesNotifierProvider);
  InAppWebViewController? get webViewController =>
      ref.read(webViewControllerNotifierProvider);
  bool get multiAddEnabled => ref.read(multiAddEnabledNotifierProvider);
  String get searchWord => ref.read(searchWordNotifierProvider);

  /// WebViewの各種設定（JavaScript有効化など）
  final InAppWebViewSettings settings = InAppWebViewSettings(
    javaScriptEnabled: true,
  );

  /// アプリ起動時に最初に表示するURL
  final String initialUrl = 'https://www.google.com/';

  /// コントローラーの初期化
  void initialize() {
    // 必要に応じて初期化処理を追加
  }

  /// ルートノードの設定
  void setRootNode(NodeWithPath node) {
    rootNodeNotifier.setRootNode(node);
    currentNodeNotifier.changeNode(node);
    urlTitlesNotifier.addTitleUrl(node.name, node.url);
  }



  /// GoogleのURLかどうか判定
  bool isGoogleUrl(String url) => url.startsWith(initialUrl);

  /// currentNodeの変更に応じてbottomNodesを更新
  void _updateBottomNodesFromCurrentNode(NodeWithPath node) {
    // Google以外のURLのノードのみを抽出
    final nonGoogleChildren = node.children
        .where((child) => !isGoogleUrl(child.url))
        .toList();
    
    // bottomNodesを更新
    bottomNodesNotifier.setNodes(nonGoogleChildren);
  }

  /// 下部バーにノードを追加（currentNodeの子ノードにも追加）
  void addBottomNode(NodeWithPath node) {
    // multiAddEnabledがtrueの場合のみ追加
    if (!multiAddEnabled) {
      return;
    }
    
    // currentNodeに子ノードを追加
    currentNode.addChild(node);
    
    // bottomNodesNotifierはcurrentNodeの変更を監視しているため、自動更新される
  }

  /// multiAddEnabledの切り替え
  void toggleMultiAddEnabled() {
    multiAddEnabledNotifier.toggle();
  }

  /// WebView生成時に呼ばれるコールバック
  void onWebViewCreated(InAppWebViewController controller) {
    webViewControllerNotifier.setController(controller);
  }

  /// ページ読み込み完了時に呼ばれるコールバック
  void onLoadStop(
      InAppWebViewController controller, WebUri? loadedUrl) async {
    if (loadedUrl == null) return;
    final urlStr = loadedUrl.toString();

    // ページタイトル取得
    String? title = await controller.getTitle();
    final pageTitle = (title != null && title.isNotEmpty) ? title : urlStr;
    
    // タイトルとURLのマップを更新
    urlTitlesNotifier.addTitleUrl(pageTitle, urlStr);

    log('ページ読み込み完了: $urlStr (タイトル: $pageTitle)');
  }

  /// リンククリック時に呼ばれるコールバック
  Future<NavigationActionPolicy> shouldOverrideUrlLoading(
    InAppWebViewController controller,
    NavigationAction navigationAction,
  ) async {
    final urlStr = navigationAction.request.url.toString();
    log('リンククリック: $urlStr');

    // multiAddEnabledがtrueの場合のみ新しいノードを作成
    if (multiAddEnabled) {
      // ページタイトルは後でonLoadStopで取得されるため、ここでは一時的な名前を使用
      String nodeName = urlStr.length > 30 ? "${urlStr.substring(0, 30)}..." : urlStr;

      // 新しいノードを作成（親から自動でパスが計算される）
      final newNode = NodeWithPath(
        name: nodeName,
        url: urlStr,
        parent: currentNode,
      );

      // 現在ノードを新しいノードに変更
      currentNodeNotifier.changeNode(newNode);
    }

    return NavigationActionPolicy.ALLOW;
  }

  /// 現在ノードの変更
  void changeNode(NodeWithPath node) {
    currentNodeNotifier.changeNode(node);
  }

  /// 親ノードに戻る
  void navigateToParentNode() {
    final parentNode = currentNode.parent as NodeWithPath?;
    if (parentNode == null) return;
    
    // 親ノードのURLにWebViewを遷移
    webViewController?.loadUrl(urlRequest: URLRequest(url: WebUri(parentNode.url)));
    
    // 現在ノードを親ノードに変更
    currentNodeNotifier.changeNode(parentNode);
  }
}

/// BrowserViewModelのProvider
final browserViewModelProvider = Provider<BrowserViewModel>((ref) {
  return BrowserViewModel(ref);
});
