import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/node/browser_node.dart';
import 'package:web_browser/core/node/browser_node_from_path_notifier.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';
import 'package:web_browser/db/providers/tree_aware_node_repository.dart';

part 'create_node_usecase.g.dart';

@riverpod
class CreateNodeUsecase extends _$CreateNodeUsecase {
  @override
  CreateNodeUsecase build() {
    return this;
  }

  /// ノードを作成し、作成されたPathを返す。
  /// BrowserNodeも同時に作成され、Notifierに登録される。
  /// URLが重複する場合はnullを返す。
  NodePath? create({required NodePath parentPath, required BrowserNode node}) {
    // 1. urlの重複を検知し、除外
    final children = ref.read(childrenAtPathMangerProvider(parentPath));
    final childrenNodeUrls = children.children.map((path) {
      final existingNode =
          ref.read(browserNodeFromPathProvider(path));
      return existingNode.url;
    }).toSet();
    if (childrenNodeUrls.contains(node.url))  return null;

    // 2. パスを取得
    final newPath = ref
        .read(childrenAtPathMangerProvider(parentPath).notifier)
        .provideNewChildPath();

    final newNode = node;
    ref.read(browserNodeFromPathProvider(newPath).notifier).setNode(newNode);

    // 3. DBに保存
    ref.read(treeAwareNodeRepositoryProvider.notifier).saveNode(newPath, newNode);

    return newPath;
  }
}
