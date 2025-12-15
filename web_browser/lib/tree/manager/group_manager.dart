import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_children.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';
import 'package:web_browser/tree/model/group.dart';

part 'group_manager.g.dart';

@Riverpod(keepAlive: true)
class GroupManager extends _$GroupManager {
  static const double groupPadding = 1;

  @override
  Group build(NodePath parentPath) {
    NodeChildren children = ref.watch(childrenAtPathMangerProvider(parentPath));
    List<Group> childrenGroups = [];
    for (var childPath in children.children) {
      Group childGroup = ref.watch(groupManagerProvider(childPath));
      childrenGroups.add(childGroup);
    }
    return Group(
      path: parentPath,
      elements: [...children.children],
      childrenGroup: childrenGroups,
      width: children.children.length + groupPadding *2, // 両端をプラス
      treeWidth: childrenGroups.fold(0, (sum, group) => sum + group.width),
    );
  }
}
