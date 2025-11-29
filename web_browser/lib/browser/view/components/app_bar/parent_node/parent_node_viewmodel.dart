import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/browser/model/browser_node.dart';
import 'package:web_browser/browser/view/components/app_bar/parent_node/parent_node_view_state.dart';
import 'package:web_browser/browser/view_model/notifiers/browser_node_from_path_notifier.dart';
import 'package:web_browser/browser/view_model/notifiers/current_path_notifier.dart';

part 'parent_node_viewmodel.g.dart';

/// ParentNodeのViewModel
///
/// 親ノードの情報と親ノードへの遷移処理を管理
///
@riverpod
class ParentNodeViewModel extends _$ParentNodeViewModel {
  ///親が存在しない場合はnullを返す
  @override
  ParentNodeState? build() {
    //親が存在しない場合はnull
    NodePath? parentPath = _currentPath.parentPath;
    if (parentPath == null) {
      return null;
    } else {
      return ParentNodeState(
        parentTitle: _getParentTitle(parentPath),
        parentPath: parentPath,
        navigateToParent: navigateToParentCallback,
      );
    }
  }

  /// 親のパスを取得
  NodePath get _currentPath => ref.watch(currentPathProvider);

  /// 親ノードの名前を取得
  String _getParentTitle(NodePath parentPath) {
    final BrowserNode parentNode =
        ref.read(browserNodeFromPathProvider(parentPath));
    return parentNode.title;

  }
  

  /// 親ノードが存在するかどうか
  bool get hasParent => _currentPath.parentPath != null;

  /// 親ノードへ遷移
  void navigateToParentCallback(){
    final NodePath? parentPath = _currentPath.parentPath;
    if (kDebugMode) {
      log("navigate to parent node: $parentPath");
    }
    if (parentPath == null) return;

    // 現在ノードを親ノードに変更
    ref.read(currentPathProvider.notifier).changePath(parentPath);
  }
}
