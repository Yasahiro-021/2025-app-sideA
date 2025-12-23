import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_children.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';
import 'package:web_browser/tree/model/group.dart';
import 'package:web_browser/tree/view/tree_settengs_provider.dart';

part 'group_manager.g.dart';

@Riverpod(keepAlive: true)
class GroupManager extends _$GroupManager {
  @override
  Group build(NodePath parentPath) {
    NodeChildren children = ref.watch(childrenAtPathMangerProvider(parentPath));
    List<NodePath> elements = children.children;
    List<Group> childrenGroups = [];
    for (var elementPath in elements) {
      //要素を親に持つグループを取得
      Group childGroup = ref.watch(groupManagerProvider(elementPath));
      childrenGroups.add(childGroup);
    }

    double groupPadding = ref.watch(treeSettingsProvider).groupPadding;
    double width = 0;
    if (elements.isNotEmpty) {
      width = elements.length + groupPadding * 2; // 両端をプラス
    }
    return Group(
      path: parentPath,
      elements: [...elements],
      childrenGroup: childrenGroups,
      width: width,
      treeWidth: _treeWidth(childrenGroups, width),
    );
  }

  double _treeWidth(List<Group> childrenGroups, double myWidth) {
    //自身をルートとするツリーの幅を計算
    double treeWidth = 0;
    treeWidth = childrenGroups.fold(
      0,
      (e, childGroup) => e += childGroup.treeWidth,
    );
    if (treeWidth < myWidth) {
      //もし子のツリー幅より自分の幅が大きければ自分の幅を採用
      treeWidth = myWidth;
    }
    return treeWidth;
  }
}
