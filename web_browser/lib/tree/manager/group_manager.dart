import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';
import 'package:web_browser/tree/model/node_group.dart';

part 'group_manager.g.dart';

///グループ（兄弟ノード）の幅を管理する
@Riverpod(keepAlive: true)
class GroupManager extends _$GroupManager {
  @override
  NodeGroup build(NodePath parentPath) {
    final children = ref.watch(childrenAtPathMangerProvider(parentPath));
    int width = 0; //初期値

    //子ノードがいない場合（Groupに入れるノードがない場合）、幅0でグループを作成
    if (children.children.isEmpty) return NodeGroup(parentPath: parentPath, width: width);

    //子ノードがいる場合、幅を計算
    width = children.children.length; //ノード間のスペース
    //子の幅の合計と、左右の余白
    return NodeGroup(parentPath: parentPath, width: width + 2);
  }

  void changeState(NodeGroup newGroup) {
    state = newGroup;
  }
}
