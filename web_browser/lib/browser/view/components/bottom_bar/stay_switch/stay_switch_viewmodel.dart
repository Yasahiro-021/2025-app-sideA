import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/view_model/notifiers/multi_add_enabled_notifier.dart';
import 'package:web_browser/browser/browser_viewmodel.dart';

/// StaySwitchのViewModel
/// 
/// 複数追加モードの状態と切り替え処理を管理
class StaySwitchViewModel {
  final Ref ref;

  StaySwitchViewModel(this.ref);

  /// 複数追加モードが有効かどうか
  bool get isMultiAddEnabled => ref.watch(multiAddEnabledNotifierProvider);

  /// 複数追加モードの切り替え
  void toggleMultiAddEnabled() {
    ref.read(browserViewModelProvider).toggleMultiAddEnabled();
  }
}

/// StaySwitchViewModelのProvider
final staySwitchViewModelProvider = Provider((ref) {
  return StaySwitchViewModel(ref);
});
