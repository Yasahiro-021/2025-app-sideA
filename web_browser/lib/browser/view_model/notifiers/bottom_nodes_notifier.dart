import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../model/node_with_path.dart';

/// 下部バーに表示するノードリストを管理するNotifierクラス
///
/// 現在のノードの子ノードの状態管理を担当
class BottomNodesNotifier extends Notifier<List<NodeWithPath>> {
  @override
  List<NodeWithPath> build() {
    // 初期状態は空リスト
    return [];
  }

  /// ノードリスト全体を設定
  void setNodes(List<NodeWithPath> nodes) {
    state = nodes;
  }

  /// ノードを追加（重複チェック）
  void addNode(NodeWithPath node) {
    // 同じパスのノードが既に存在しないかチェック
    if (!state.any((n) => n.path == node.path)) {
      state = [...state, node];
    }
  }

  /// ノードを削除
  void removeNode(NodeWithPath node) {
    state = state.where((n) => n.path != node.path).toList();
  }
}

final bottomNodesNotifierProvider =
    NotifierProvider<BottomNodesNotifier, List<NodeWithPath>>(
  () => BottomNodesNotifier(),
);
