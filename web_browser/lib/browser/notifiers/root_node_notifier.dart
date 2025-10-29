import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/node_with_path.dart';

/// ルートノードを管理するNotifierクラス
///
/// 履歴ツリーのルートノードの状態管理を担当
class RootNodeNotifier extends Notifier<NodeWithPath> {
  @override
  NodeWithPath build() {
    // 初期ルートノード（空のルートノード）
    return NodeWithPath.root(
      name: "      ",
      url: "",
    );
  }

  /// ルートノードの設定
  void setRootNode(NodeWithPath node) {
    state = node;
  }
}

final rootNodeNotifierProvider =
    NotifierProvider<RootNodeNotifier, NodeWithPath>(
  () => RootNodeNotifier(),
);
