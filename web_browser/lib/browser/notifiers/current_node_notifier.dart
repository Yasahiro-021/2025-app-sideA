import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../node/node_with_path.dart';
import 'root_node_notifier.dart';

/// 現在のノードを管理するNotifierクラス
///
/// 現在表示中のノードの状態管理を担当
class CurrentNodeNotifier extends Notifier<NodeWithPath> {
  @override
  NodeWithPath build() {
    // 初期状態はルートノードと同じ
    return ref.watch(rootNodeNotifierProvider);
  }

  /// 現在ノードの変更
  void changeNode(NodeWithPath node) {
    state = node;
  }
}

final currentNodeNotifierProvider =
    NotifierProvider<CurrentNodeNotifier, NodeWithPath>(
  () => CurrentNodeNotifier(),
);
