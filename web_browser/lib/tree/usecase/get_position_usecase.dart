import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_children.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';
import 'package:web_browser/tree/model/node_location.dart';

part 'get_position_usecase.g.dart';

@riverpod
class GetPosition extends _$GetPosition {
  @override
  NodeLocation build(NodePath nodePath) {
    int depth = nodePath.path.length;

    return NodeLocation(depth: depth, index: _index);
  }

  int get _index {
    NodePath? parentPath = nodePath.parentPath;
    if (parentPath == null) {
      return -1; // Root node
    }else{
      NodeChildren children = ref.watch(childrenAtPathMangerProvider(parentPath));
      int i = children.children.indexOf(nodePath);
      return i;
    }
  }
}