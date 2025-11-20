import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/node_path.dart';
import '../../model/node_with_path.dart';

@riverpod
class NodeWithPathNotifier extends _$NodeWithPathNotifier {
  @override
  NodeWithPath build(NodePath path) {

    //渡されたパスを持ったノードを作成
    NodeWithPath initialNode = NodeWithPath(path: path, title: '', url: '', parentPath: path.parentPath);
    return initialNode;
  }

  /// ノードの変更
  void changeNode(NodeWithPath node) {
    state = node;
  }
}
