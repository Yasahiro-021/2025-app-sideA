

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/node/node_path.dart';

part 'current_path_notifier.g.dart';

@riverpod
class CurrentPathNotifier extends _$CurrentPathNotifier {
  @override
  NodePath build() {
    // 初期状態はルートパス
    return NodePath(path: []);
  }

  /// 現在パスを変更するメソッド
  void changePath(NodePath newPath) {
    if (kDebugMode) {
      log("current path change : $newPath");
    }
    state = newPath;
  }
}