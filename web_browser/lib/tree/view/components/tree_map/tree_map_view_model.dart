import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';
import 'package:web_browser/tree/view/components/tree_map/tree_map_state.dart';

part 'tree_map_view_model.g.dart';

@riverpod
class TreeMapViewModel extends _$TreeMapViewModel {
  @override
  TreeMapState build() {
    // ツリー内の全てのパスを深さ優先・帰りがけ順で取得
    final allPathAndHasChildren = searchPathSync(
      startPath: NodePath.root,
      ref: ref,
    );
    return TreeMapState(allPathsAndHasChildren: allPathAndHasChildren);
  }

  /// startから全てのパスを探索し、深さ優先・帰りがけ順でStreamを流す。
  /// 再帰処理
  Iterable<(NodePath, bool)> searchPathSync({
    required NodePath startPath,
    required Ref ref,
  }) sync* {
    final List<NodePath> children = ref
        .read(childrenAtPathMangerProvider(startPath))
        .children;
    bool hasChildren = children.isNotEmpty;
    // 子が存在しない（葉ノード）の場合は現在のパスを返す
    if (children.isEmpty) yield (startPath, hasChildren);

    // 子が存在する場合は各子に対して再帰的に探索を行う
    for (final childPath in children) {
      yield* searchPathSync(startPath: childPath, ref: ref);
    }
    yield (startPath, hasChildren);
  }
}
