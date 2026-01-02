import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_children.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';

/// テスト用にChildrenAtPathManangerをモックするユーティリティ関数
/// [createChildCount]で指定された親パスに指定された数の子ノードを作成する
///
/// Overrideのリストを返すので、ProviderContainerのoverridesに渡して使用する
List<Override> mockChildrenAtPath(List<(NodePath, int)> createChildCount) {
  List<NodePath> shouldEmptyMockPaths =
      []; // モックする過程で作成したパスを格納するリスト。参照されるためモックする必要がある。
  List<(NodePath, List<NodePath>)> childrenList = createChildCount.map((e) {
    NodePath parentPath = e.$1;
    int childCount = e.$2;
    List<NodePath> childPaths = List.generate(
      childCount,
      (index) => parentPath.createChildPath(index),
    );
    shouldEmptyMockPaths.addAll(childPaths);
    return (parentPath, childPaths);
  }).toList();

  //モックに呼び出されるグループを作成しておく。
  shouldEmptyMockPaths = shouldEmptyMockPaths
      .where(
        //モックされていないパスのみ抽出
        (path) => createChildCount.map((e) => e.$1).contains(path) == false,
      )
      .toList();

  List<Override> emptyOverrides = shouldEmptyMockPaths.map((path) {
    return childrenAtPathMangerProvider(
      path,
    ).overrideWithValue(NodeChildren(children: []));
  }).toList();

  List<Override> overrides = [
    ...childrenList.map((e) {
      NodePath path = e.$1;
      return childrenAtPathMangerProvider(
        path,
      ).overrideWithValue(NodeChildren(children: e.$2));
    }),
    ...emptyOverrides,
  ];
  return overrides;
}
