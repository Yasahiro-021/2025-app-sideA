
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/model/tree_node.dart';
import 'package:web_browser/tree/usecase/get_position_usecase.dart';

part 'tree_node_view_model.g.dart';

@Riverpod(keepAlive: true)
class TreeNodeViewModel extends _$TreeNodeViewModel {
  @override
   TreeNode build(NodePath nodePath) {
    final treeNode = TreeNode(title: 'hoge', date: '11/01/2024');
    final loc = ref.watch(getPositionProvider(nodePath));
    return treeNode;
  }
}