import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/view_model/notifiers/current_node_notifier.dart';
import 'package:web_browser/browser/browser_viewmodel.dart';

/// ParentNodeのViewModel
/// 
/// 親ノードの情報と親ノードへの遷移処理を管理
class ParentNodeViewModel {
  final Ref ref;

  ParentNodeViewModel(this.ref);

  /// 現在のノードを取得
  get currentNode => ref.watch(currentNodeNotifierProvider);

  /// 親ノードの名前を取得
  String get parentName {
    final parent = currentNode.parent;
    return parent?.name ?? '';
  }

  /// 親ノードが存在するかどうか
  bool get hasParent => currentNode.parent != null;

  /// 親ノードへ遷移
  void navigateToParent() {
    ref.read(browserViewModelProvider).navigateToParentNode();
  }
}

/// ParentNodeViewModelのProvider
final parentNodeViewModelProvider = Provider((ref) {
  return ParentNodeViewModel(ref);
});
