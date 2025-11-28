import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 検索バーの展開状態を管理するNotifier
class SearchBarExpandedNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void toggle() {
    state = !state;
  }

  void expand() {
    state = true;
  }

  void collapse() {
    state = false;
  }
}

final searchBarExpandedNotifierProvider =
    NotifierProvider<SearchBarExpandedNotifier, bool>(
  () => SearchBarExpandedNotifier(),
);
