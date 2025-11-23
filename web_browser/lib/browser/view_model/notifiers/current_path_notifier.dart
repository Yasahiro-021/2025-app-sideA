

import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/browser/model/node_path.dart';

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
    log("current path change : $newPath");
    state = newPath;
  }
}