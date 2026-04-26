import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/providers/current_tree_notifier.dart';
import 'package:web_browser/core/tree/tree_id.dart';
import 'package:web_browser/db/providers/node_repository_provider.dart';
import 'package:web_browser/db/repositories/node_repository.dart';
import 'package:web_browser/db/repositories/tree_aware_node_repository.dart';

part 'tree_aware_node_repository_provider.g.dart';

@riverpod
Future<TreeAwareNodeRepository> treeAwareNodeRepository(Ref ref) async {
  NodeRepository nodeRepository = ref.read(nodeRepositoryProvider);
  TreeId currentTreeId = await ref.read(currentTreeProvider.future);

  return TreeAwareNodeRepository(
    nodeRepository: nodeRepository,
    currentTreeId: currentTreeId,
  );
}
