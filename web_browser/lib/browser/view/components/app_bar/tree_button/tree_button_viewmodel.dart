import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/node/browser_node_from_path_notifier.dart';
import 'package:web_browser/browser/view_model/notifiers/root_path_provider.dart';
import 'package:web_browser/core/node/browser_node.dart';
import 'package:web_browser/core/providers/current_tree_notifier.dart';
import 'package:web_browser/core/tree/tree_id.dart';

part 'tree_button_viewmodel.g.dart';
/// TreeButtonのViewModel
/// 
/// TreeButtonViewに必要な情報を処理する。
@riverpod
class TreeButtonViewModel extends _$TreeButtonViewModel {
  @override
  TreeButtonViewModel build() {
    return this;
  }

  //（非公開）ルートのパスを取得
  NodePath get _rootPath => ref.read(rootPathProvider);

  // (非公開) ルートノードを取得
  BrowserNode get _rootNode => ref.watch(browserNodeFromPathProvider(_rootPath));

  /// ルートノードの名前を取得
  String get rootNodeName => _rootNode.title;
    /// 現在のツリーIDを取得
  Future<TreeId> get currentTreeId => ref.watch(currentTreeProvider.future);
}