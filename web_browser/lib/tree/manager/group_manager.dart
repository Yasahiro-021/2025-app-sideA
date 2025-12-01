import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/model/node_group.dart';

part 'group_manager.g.dart';
@riverpod
class GroupManager extends _$GroupManager {
  @override
  NodeGroup build(NodePath parentPath){
    return NodeGroup(parentPath: parentPath, leftPos: 0, rightPos: 0);
    }
}