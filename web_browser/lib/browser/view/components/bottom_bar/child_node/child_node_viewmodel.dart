import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/node/browser_node_from_path_notifier.dart';
import 'package:web_browser/browser/view_model/notifiers/current_path_notifier.dart';

part 'child_node_viewmodel.g.dart';

/// ChildNodeのViewModel
///
/// 子ノードへの遷移処理を管理
@riverpod
class ChildNodeViewModel extends _$ChildNodeViewModel {
  @override
  String build(NodePath nodePath) {
    final String nodeName = ref
        .watch(browserNodeFromPathProvider(nodePath))
        .title;
    return nodeName;
  }

  /// 現在パスを自身に変更（ノードへ遷移）
  void navigateToNode() {
    ref.read(currentPathProvider.notifier).changePath(nodePath);
  }
}
