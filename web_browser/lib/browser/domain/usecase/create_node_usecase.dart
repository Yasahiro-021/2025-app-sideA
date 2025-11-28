import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/browser/model/node_path.dart';
import 'package:web_browser/browser/model/browser_node.dart';
import 'package:web_browser/browser/view_model/notifiers/browser_node_children_notifier.dart';
import 'package:web_browser/browser/view_model/notifiers/browser_node_from_path_notifier.dart';

part 'create_node_usecase.g.dart';

@riverpod
class CreateNodeUsecase extends _$CreateNodeUsecase {
  @override
  CreateNodeUsecase build() {
    return this;
  }

  /// ノードを作成し、作成されたPathを返す。
  /// BrowserNodeも同時に作成され、Notifierに登録される。
  /// nodeがnullの場合は、空のノードを作成して登録する。
  NodePath create({required NodePath parentPath, BrowserNode? node}) {
    if (kDebugMode) {
      log("create node|| parent path $parentPath, node: $node");
    }
    final NodePath newPath = ref
        .read(browserNodeChildrenProvider(parentPath).notifier)
        .provideNewChildPath();

    // 作成されたPathとnodeを紐付けて登録
    ref.read(browserNodeFromPathProvider(newPath).notifier).setNode(
          node ??
              BrowserNode(
                title: '',
                url: '',
              ),
        );

    return newPath;
  }
}
