import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/node/browser_node.dart';
import 'package:web_browser/db/providers/tree_aware_node_repository.dart';

part 'browser_node_from_path_notifier.g.dart';

@Riverpod(keepAlive: true)
class BrowserNodeFromPathNotifier extends _$BrowserNodeFromPathNotifier {
  @override
  BrowserNode build(NodePath path) {
    //dbから取得。ない場合は空のノードを返す
    _loadFromDb(path);
    return BrowserNode(title: '', url: '');
  }

  void _loadFromDb(NodePath path) async {
    final node = await ref
        .read(treeAwareNodeRepositoryProvider.notifier)
        .getNodeByPath(path);
    if (node != null) {
      state = node;
    }
  }

  /// ノードを設定
  void setNode(BrowserNode node) {
    ref.read(treeAwareNodeRepositoryProvider.notifier).saveNode(path, node);
    state = node;
  }
}
