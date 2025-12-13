import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/browser/view_model/notifiers/multi_add_enabled_notifier.dart';

part 'stay_switch_viewmodel.g.dart';

/// StaySwitchのViewModel
///
/// 複数追加モードの状態と切り替え処理を管理
@riverpod
class StaySwitchViewModel extends _$StaySwitchViewModel {
  @override
  bool build() {
    // 初期状態はmultiAddEnabledProviderの状態を反映
    return ref.watch(multiAddEnabledProvider);
  }

  /// 複数追加モードの切り替え
  void toggleMultiAddEnabled() {
    ref.read(multiAddEnabledProvider.notifier).toggle();
  }
}
