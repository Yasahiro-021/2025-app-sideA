import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/browser_viewmodel.dart';
import 'package:web_browser/browser/model/node_with_path.dart';

/// ChildNodeのViewModel
/// 
/// 子ノードへの遷移処理を管理
class ChildNodeViewModel {
  final Ref ref;
  final NodeWithPath node;

  ChildNodeViewModel(this.ref, this.node);

  /// ノード名を取得
  String get nodeName => node.name;

  /// 子ノードに遷移
  void navigateToNode() {
    ref.read(browserViewModelProvider).changeNode(node);
  }
}

/// ChildNodeViewModelのProvider（パラメータ付き）
final childNodeViewModelProvider = Provider.family<ChildNodeViewModel, NodeWithPath>((ref, node) {
  return ChildNodeViewModel(ref, node);
});
