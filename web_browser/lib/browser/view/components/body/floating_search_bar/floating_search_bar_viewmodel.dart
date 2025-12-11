
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/core/usecase/create_node_usecase.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/browser/view_model/notifiers/current_path_notifier.dart';
import 'package:web_browser/browser/view_model/notifiers/search_bar_expanded_notifier.dart';
import 'package:web_browser/browser/view_model/notifiers/search_word_notifier.dart';
import 'package:web_browser/core/node/browser_node.dart';

/// FloatingSearchBarのViewModel
///
/// 検索バーの展開状態と検索処理を管理
class FloatingSearchBarViewModel {
  final Ref ref;

  FloatingSearchBarViewModel(this.ref);

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

    final searchUrl =
        'https://www.google.com/search?q=${Uri.encodeComponent(searchWord)}';

    // 新しいノードを作成
    final BrowserNode newNode = BrowserNode(title: searchWord, url: searchUrl
    );

    //現在のpath（新しいノードの親）を取得
    NodePath currentPath = ref.read(currentPathProvider);

    //新しいノードを追加
    final NodePath resultPath = ref
        .read(createNodeUsecaseProvider)
        .create(
          parentPath: currentPath,
          node: newNode,
        );

    
    // 新しいノードに遷移
    ref.read(currentPathProvider.notifier).changePath(resultPath);

    // 検索バーを折りたたむ
    collapse();
  }
}

/// FloatingSearchBarViewModelのProvider
final floatingSearchBarViewModelProvider = Provider((ref) {
  return FloatingSearchBarViewModel(ref);
});
