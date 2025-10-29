import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 検索ワードを管理するNotifierクラス
///
/// 検索バーの入力値の状態管理を担当
class SearchWordNotifier extends Notifier<String> {
  @override
  String build() {
    // 初期状態は空文字列
    return '';
  }

  /// 検索ワードを設定
  void setSearchWord(String word) {
    state = word;
  }

  /// 検索ワードをクリア
  void clear() {
    state = '';
  }
}

final searchWordNotifierProvider =
    NotifierProvider<SearchWordNotifier, String>(
  () => SearchWordNotifier(),
);
