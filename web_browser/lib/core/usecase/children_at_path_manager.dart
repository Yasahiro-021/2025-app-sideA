import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_children.dart';
import 'package:web_browser/core/node/node_path.dart';

part 'children_at_path_manager.g.dart';

@Riverpod(keepAlive:true)
class ChildrenAtPathManger extends _$ChildrenAtPathManger {
  @override
  NodeChildren build(NodePath parentPath) {
    return NodeChildren(children: []);
  }

    void setChildNodes({required NodeChildren nodes}) {
    state = nodes;
  }

  int _lastIndex = 0;

  // 新しいパスを作成し、リストに追加。作成したパスを返す
  NodePath provideNewChildPath() {
    final NodePath newPath = parentPath.createChildPath(_lastIndex);
    _lastIndex++;
    //childrenを展開し、末尾に新しいパスを追加後、stateを更新
    state = NodeChildren(children: [...state.children, newPath]);

    return newPath;
  }
}