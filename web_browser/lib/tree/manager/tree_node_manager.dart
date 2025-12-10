

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/browser_node.dart';
import 'package:web_browser/core/node/browser_node_from_path_notifier.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/model/tree_node.dart';

part 'tree_node_manager.g.dart';
@riverpod
class TreeNodeManager extends _$TreeNodeManager {
  @override
  TreeNode build(NodePath path) {
    final BrowserNode browserNode = ref.watch(browserNodeFromPathProvider(path));
    final String date = browserNode.date ?? "";
    return TreeNode(title: browserNode.title, date: date);
  }
}