import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/browser/model/node_children.dart';

import '../../model/node_path.dart';

part 'browser_node_children_notifier.g.dart';

@Riverpod(keepAlive: true)
class BrowserNodeChildrenNotifier extends _$BrowserNodeChildrenNotifier {
  @override
  NodeChildren build(NodePath parentPath) {
    // 初期状態は空
    return NodeChildren(children: []);
  }

  void setChildNodes({required NodeChildren nodes, required int lastIndex}) {
    state = nodes;
  }

  int _lastIndex = 0;

  // 新しいパスを作成し、リストに追加。作成したパスを返す
  NodePath provideNewChildPath() {
    final NodePath newPath = parentPath.createChildPath(_lastIndex);
    _lastIndex++;
    //childrenを展開し、末尾に新しいパスを追加後、stateを更新
    state = NodeChildren(children: [...state.children, newPath]);

    log(
      "provideNewChildPath called. parentPath: $state, lastIndex: $_lastIndex",
    );
    return newPath;
  }

  void removeChildNode(NodePath path) {
    state = NodeChildren(
      children: state.children.where((n) => n != path).toList(),
    );
  }
}
