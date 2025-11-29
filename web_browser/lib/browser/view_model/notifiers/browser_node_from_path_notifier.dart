import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/node/node_path.dart';

import '../../model/browser_node.dart';

part 'browser_node_from_path_notifier.g.dart';

@Riverpod(keepAlive: true)
class BrowserNodeFromPathNotifier extends _$BrowserNodeFromPathNotifier {

  @override
  BrowserNode build(NodePath path) {
    if (kDebugMode) {
      log("build BrowserNodeFromPathNotifier || path: $path");
    }
    //ノードがnull場合は空のノードで作成する。
    return BrowserNode(
      title: '',
      url: '',
    );
  }

  /// ノードを設定
  void setNode(BrowserNode node) {
    state = node;
  }
}