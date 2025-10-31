import 'package:hooks_riverpod/hooks_riverpod.dart';

/// タイトルとURLのマッピングを管理するNotifierクラス
///
/// 各タイトルに対応するページURLの管理を担当
class UrlTitlesNotifier extends Notifier<Map<String, String>> {
  @override
  Map<String, String> build() {
    // 初期状態: Googleのタイトルとタイトルを登録
    return {'Google': 'https://www.google.com/'};
  }

  /// タイトルとURLを追加
  void addTitleUrl(String title, String url) {
    state = {...state, title: url};
  }

  /// URLを更新
  void updateTitleUrl(String title, String url) {
    state = {...state, title: url};
  }
}

final urlTitlesNotifierProvider =
    NotifierProvider<UrlTitlesNotifier, Map<String, String>>(
  () => UrlTitlesNotifier(),
);
