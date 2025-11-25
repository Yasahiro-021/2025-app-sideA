import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/browser/model/node_path.dart';
import 'package:web_browser/browser/model/browser_node.dart';
import 'package:web_browser/browser/view_model/notifiers/browser_node_from_path_notifier.dart';
import 'package:web_browser/browser/view_model/notifiers/current_path_notifier.dart';

part 'parent_node_viewmodel.g.dart';

/// ParentNodeのViewModel
///
/// 親ノードの情報と親ノードへの遷移処理を管理
///
@riverpod
class ParentNodeViewModel extends _$ParentNodeViewModel {
  @override
  ParentNodeViewModel build() {
    return this;
  }

  /// 親のパスを取得
  NodePath get _currentPath => ref.watch(currentPathProvider);

  /// 親ノードの名前を取得
  String get parentTitle {
    //親ノードを取得
    NodePath? parentPath = _currentPath.parentPath;
    if (parentPath == null) {
      // 親ノードが存在しない場合は空文字を返す（ルートノードの場合）
      return '';
    } else {
      //親ノードのタイトルを返す
      final BrowserNode parent = ref.watch(
        browserNodeFromPathProvider(parentPath),
      );
      return parent.title;
    }
  }

  /// 親ノードが存在するかどうか
  bool get hasParent => _currentPath.parentPath != null;

  /// 親ノードへ遷移
  void navigateToParent() {
    final NodePath? parentPath = _currentPath.parentPath;
    // 親ノードが存在しない場合は何もしない
    if (kDebugMode) {
      log("navigate to parent node: $parentPath");
    }
    if (parentPath == null) return;

    // 現在ノードを親ノードに変更
    ref.read(currentPathProvider.notifier).changePath(parentPath);
  }
}
