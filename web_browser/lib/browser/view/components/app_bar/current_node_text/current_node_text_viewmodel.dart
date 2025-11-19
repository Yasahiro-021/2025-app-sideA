import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/view_model/notifiers/current_node_notifier.dart';

/// CurrentNodeTextのViewModel
/// 
/// 現在のノード名を取得して提供
class CurrentNodeTextViewModel {
  final Ref ref;

  CurrentNodeTextViewModel(this.ref);

  /// 現在のノード名を取得
  String get currentNodeName {
    final currentNode = ref.watch(currentNodeNotifierProvider);
    return currentNode.title;
  }
}

/// CurrentNodeTextViewModelのProvider
final currentNodeTextViewModelProvider = Provider((ref) {
  return CurrentNodeTextViewModel(ref);
});
