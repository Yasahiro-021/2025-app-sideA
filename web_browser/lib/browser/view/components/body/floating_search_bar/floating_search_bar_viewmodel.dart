import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/browser_viewmodel.dart';
import 'package:web_browser/browser/view_model/notifiers/search_bar_expanded_notifier.dart';
import 'package:web_browser/browser/view_model/notifiers/search_word_notifier.dart';
import 'package:web_browser/browser/view_model/notifiers/root_node_notifier.dart';
import 'package:web_browser/browser/view_model/notifiers/current_node_notifier.dart';
import 'package:web_browser/browser/view_model/notifiers/url_titles_notifier.dart';
import 'package:web_browser/browser/model/node_with_path.dart';

/// FloatingSearchBarのViewModel
/// 
/// 検索バーの展開状態と検索処理を管理
class FloatingSearchBarViewModel {
  final Ref ref;

  FloatingSearchBarViewModel(this.ref);

  /// BrowserViewModelを取得
  BrowserViewModel get _browserViewModel => ref.read(browserViewModelProvider);

  /// 検索バーが展開されているか
  bool get isExpanded => ref.watch(searchBarExpandedNotifierProvider);

  /// 検索バーの展開状態を切り替え
  void toggleExpanded() {
    ref.read(searchBarExpandedNotifierProvider.notifier).toggle();
  }

  /// 検索バーを折りたたむ
  void collapse() {
    ref.read(searchBarExpandedNotifierProvider.notifier).collapse();
  }

  /// 検索ワードを設定
  void setSearchWord(String word) {
    ref.read(searchWordNotifierProvider.notifier).setSearchWord(word);
  }

  /// 検索を実行
  void performSearch(String searchWord) {
    if (searchWord.trim().isEmpty) return;

    final searchUrl = 'https://www.google.com/search?q=${Uri.encodeComponent(searchWord)}';
    
    // 新しいルートノードを作成
    final newRootNode = NodeWithPath.root(
      name: searchWord,
      url: searchUrl,
    );

    // ルートノードと現在ノードを設定
    ref.read(rootNodeNotifierProvider.notifier).setRootNode(newRootNode);
    ref.read(currentNodeNotifierProvider.notifier).changeNode(newRootNode);
    
    // タイトルとURLを登録
    ref.read(urlTitlesNotifierProvider.notifier).addTitleUrl(searchWord, searchUrl);

    // WebViewで検索URLを読み込み
    _browserViewModel.webViewController?.loadUrl(
      urlRequest: URLRequest(url: WebUri(searchUrl)),
    );

    // 検索バーを折りたたむ
    collapse();
  }
}

/// FloatingSearchBarViewModelのProvider
final floatingSearchBarViewModelProvider = Provider((ref) {
  return FloatingSearchBarViewModel(ref);
});
