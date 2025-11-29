import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/browser/model/browser_node.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/browser/view_model/notifiers/browser_node_from_path_notifier.dart';
import 'package:web_browser/browser/view_model/notifiers/current_path_notifier.dart';

part 'current_node_provider.g.dart';

/// 現在のノードを提供する
@riverpod
BrowserNode currentNodeProvider(Ref ref){
  final NodePath currentPath = ref.watch(currentPathProvider);
  final BrowserNode currentNode = ref.watch(browserNodeFromPathProvider(currentPath));
  if (kDebugMode) {
    log("current node : $currentNode");
  }
  return currentNode;
}
