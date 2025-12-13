import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_children.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/db/providers/tree_aware_node_repository.dart';

part 'children_at_path_manager.g.dart';

@Riverpod(keepAlive: true)
class ChildrenAtPathManger extends _$ChildrenAtPathManger {
  @override
  NodeChildren build(NodePath parentPath) {
    //dbを確認して子ノードがあれば取得、なければ空のままNodeChildrenを初期値に
    NodeChildren children = NodeChildren(children: []);

    //dbから子ノードを取得
    _loadFromDb();

    return children;
  }

  Future<void> _loadFromDb() async {
    //dbから子ノードを取得してstateを更新
    final NodeChildren node = await ref
        .read(treeAwareNodeRepositoryProvider.notifier)
        .getChildrenPaths(parentPath);
    
    //子が空なら何もしない
    if(node.children.isEmpty) return;
    
    //stateを更新。
    state = node;
  }

  void setChildNodes({required NodeChildren nodes}) {
    state = nodes;
  }

  int get _lastIndex{
    //最後の子（一番大きいインデックス）
    List<NodePath> children = state.children;
    if(children.isEmpty) return 0;
    //indexはpathの最後の要素
    int lastIndex = children.last.path.last+1;
    return lastIndex;
  }

  // 新しいパスを作成し、リストに追加。作成したパスを返す
  NodePath provideNewChildPath() {
    final NodePath newPath = parentPath.createChildPath(_lastIndex);

    
    //childrenを展開し、末尾に新しいパスを追加後、stateを更新
    state = NodeChildren(children: [...state.children, newPath]);

    return newPath;
  }
}
