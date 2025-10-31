import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/node_with_path.dart';

/// 現在のノードを管理するNotifierクラス
///
/// 現在表示中のノードの状態管理を担当
/// 他のNotifierはこのNotifierの状態を参照する。
class CurrentNodeNotifier extends Notifier<NodeWithPath> {
  @override
  NodeWithPath build() {
    // 初期状態はルートノードと同じ
    return NodeWithPath.root(name: "ROOT", url: "URL"); //TODO ROOTノードをNotifierから取得するようにする。
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
