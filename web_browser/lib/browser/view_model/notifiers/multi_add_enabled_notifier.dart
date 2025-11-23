import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 複数ノード追加の有効/無効を管理するNotifierクラス
///
/// リンククリック時に自動的に新しいノードを追加するかを制御
class MultiAddEnabledNotifier extends Notifier<bool> {
  @override
  bool build() {
    // 初期状態は有効
    return true;
  }

  /// 状態を切り替え
  void toggle() {
    state = !state;
  }

  /// 明示的に設定
  void setEnabled(bool enabled) {
    state = enabled;
  }
}

final multiAddEnabledNotifierProvider =
    NotifierProvider<MultiAddEnabledNotifier, bool>(
  () => MultiAddEnabledNotifier(),
);
