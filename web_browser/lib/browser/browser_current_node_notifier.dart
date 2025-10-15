import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../node/node.dart';

// DEPRECATED: このファイルは旧アーキテクチャです。
// 新しい実装は notifiers/current_node_notifier.dart を参照してください。

///現在のノードの保持と変更を担当する。
@Deprecated('Use CurrentNodeNotifier from notifiers/current_node_notifier.dart instead')
final browserCurrentNodeNotifier = NotifierProvider<BrowserCurrentNodeNotifier,Node>(
  () => BrowserCurrentNodeNotifier(),
);

@Deprecated('Use CurrentNodeNotifier from notifiers/current_node_notifier.dart instead')
class BrowserCurrentNodeNotifier extends Notifier<Node> {
  @override
  Node build() {
    return Node("root");
  }
  void changeNode(Node node){
    state = node;
  }
}