import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/view_model/notifiers/root_node_notifier.dart';
import 'package:web_browser/browser/model/node_with_path.dart';

/// TreeButtonのViewModel
/// 
/// ルートノードの状態を管理し、ツリー画面への遷移に必要なデータを提供する
class TreeButtonViewModel {
  final Ref ref;

  TreeButtonViewModel(this.ref);

  /// ルートノードを取得
  NodeWithPath get rootNode => ref.watch(rootNodeNotifierProvider);

  /// ルートノードの名前を取得
  String get rootNodeName => rootNode.name;
}

/// TreeButtonViewModelのProvider
final treeButtonViewModelProvider = Provider((ref) {
  return TreeButtonViewModel(ref);
});
