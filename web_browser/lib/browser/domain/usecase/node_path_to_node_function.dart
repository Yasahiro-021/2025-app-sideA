import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/browser/model/node_path.dart';
import 'package:web_browser/browser/view_model/notifiers/browser_node_from_path_notifier.dart';
import 'package:web_browser/node/node.dart';

import '../../model/browser_node.dart';

part 'node_path_to_node_function.g.dart';

/// NodeWithPathからNodeへの変換関数を提供する。
@riverpod
Node Function(NodePath) nodeWithPathToNode(Ref ref) {
  return (NodePath path) {
    final BrowserNode browserNode = ref.read(browserNodeFromPathProvider(path));

    NodePath? parentPath = path.parentPath;
    Node? parentNode;
    if (parentPath != null) {
      // 再帰的に親ノードを取得
      parentNode = ref.read(nodeWithPathToNodeProvider)(parentPath);
    }else {
      // ルートノードの場合、親ノードはnull
      parentNode = null;
    }
    return Node(browserNode.title,parentNode);
  };
}
